require 'addressable/uri'
require 'multi_json'
require 'typhoeus'

module OpenRTB
  class Client
    attr_accessor :proxy
    attr_writer :logger, :user_agent, :version

    def initialize(openrtb_url)
      @endpoint = Addressable::URI.parse(openrtb_url)
      yield(self) if block_given?
    end

    def logger
      @logger ||= OpenRTB::NullObject.new
    end

    def user_agent
      @user_agent ||= "OpenRTB Ruby Client #{OpenRTB::VERSION}"
    end

    def version
      @version ||= '2.1'
    end

    def request(data)
      response = Typhoeus.post(base_url, options(body: MultiJson.dump(data)))

      if response.success?
        return OpenRTB::Response.new MultiJson.load(response.body)
      elsif response.timed_out?
        raise OpenRTB::Error::RequestTimeout.new
      elsif response.code == 0
        raise OpenRTB::Error.new(response.return_message)
      else
        klass = OpenRTB::Error.errors[response.code]
        klass ||= OpenRTB::Error
        raise klass.new(response.status_message)
      end
    rescue MultiJson::ParseError => e
      raise OpenRTB::JsonError.new(e.cause)
    end

  private
    def base_url
      @endpoint.omit(:userinfo).to_s
    end

    def options(hash = {})
      hash[:headers] ||= {}
      hash[:headers]['x-openrtb-version'] = version
      hash[:headers]['Content-Type'] = 'application/json'
      hash[:headers]['User-Agent']   = user_agent
      hash[:proxy]   = proxy if defined?(@proxy)
      hash[:verbose] = false
      hash[:userpwd] = @endpoint.userinfo if @endpoint.userinfo
      hash[:followlocation]  = false
      hash[:accept_encoding] = 'gzip'
      hash[:ssl_verifypeer]  = false
      hash[:ssl_verifyhost]  = 0
      hash
    end

  end
end