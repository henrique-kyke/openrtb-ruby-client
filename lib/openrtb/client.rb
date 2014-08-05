require 'addressable/uri'
require 'multi_json'
require 'typhoeus'
require 'logger'

Typhoeus::Config.memoize = false
Typhoeus::Config.verbose = false

module OpenRTB
  class Client
    attr_accessor :proxy
    attr_writer :logger, :max_concurrency, :user_agent, :version

    class Queue
      include NullObject::Conversions

      def initialize(client, hydra)
        @client = client
        @hydra  = hydra
      end

      def responses
        @responses ||= []
      end

      def post(endpoint, body = {})
        req = request(endpoint, :post, OpenRTB::Request.new(body))
        req.on_complete { |res| responses << res }

        @hydra.queue req
      end

    private

      def request(endpoint, method, body)
        uri = Addressable::URI.parse(Just(endpoint))
        opt = {body: MultiJson.dump(body), method: method}
        opt.merge!(userpwd: uri.userinfo) if uri.userinfo

        Typhoeus::Request.new(uri.omit(:userinfo).to_s, options(opt))
      end

      def options(hash = {})
        hash[:proxy] = @client.proxy
        hash[:headers] ||= {}
        hash[:headers]['Content-Type'] = 'application/json'
        hash[:headers]['User-Agent']   = @client.user_agent
        hash[:headers]['x-openrtb-version'] = @client.version
        hash[:timeout] = 1
        hash[:connecttimeout]  = 1
        hash[:followlocation]  = false
        hash[:accept_encoding] = 'gzip'
        hash[:ssl_verifypeer]  = false
        hash[:ssl_verifyhost]  = 0
        hash
      end
    end

    def initialize
      yield(self) if block_given?
    end

    def logger
      @logger ||= OpenRTB::NullObject.new
    end

    def max_concurrency
      @max_concurrency ||= 2
    end

    def user_agent
      @user_agent ||= "OpenRTB Ruby Client #{OpenRTB::VERSION}"
    end

    def version
      @version ||= '2.1'
    end

    def execute(&block)
      hydra = Typhoeus::Hydra.new(max_concurrency: max_concurrency)
      queue = Queue.new(self, hydra)
      block.call(queue)
      hydra.run

      handle_responses(queue.responses)
    end

  private

    def handle_responses(responses)
      result = []
      responses.each do |res|
        begin
          logger.debug({
            effective_url: res.effective_url,
            primary_ip: res.primary_ip,
            response_code: res.response_code,
            response_headers: res.response_headers,
            namelookup_time: res.namelookup_time,
            connect_time: res.connect_time,
            app_connect_time: res.app_connect_time,
            pretransfer_time: res.pretransfer_time,
            start_transfer_time: res.start_transfer_time,
            total_time: res.total_time,
            body: res.body})

          result.push OpenRTB::Response.new(MultiJson.load(res.body)) if res.success?
        rescue MultiJson::ParseError => e
          logger.error(e.cause)
        end
      end
      result
    end
  end
end