require 'helper'
require 'webmock'
WebMock.disable_net_connect!

describe OpenRTB::Client do
  include WebMock::API

  let(:endpoint) { 'http://api.example.org/exchange.json' }
  let(:request) { {
    id: 1
    } }
  let(:headers) { {
    'User-Agent'        => @client.user_agent,
    'Content-Type'      => 'application/json',
    'X-Openrtb-Version' => @client.version
    } }

  before do
    @client = OpenRTB::Client.new(endpoint)
  end

  after do
    WebMock.reset!
  end

  def fixture(file)
    File.new(File.join(File.expand_path('../fixtures', __FILE__), file))
  end

  describe '#request' do
    it 'encodes the body and makes the request with the correct headers' do
      stub_request(:post, endpoint).to_return(status: 200, body: fixture('response.json'))
      response = @client.request(request)

      assert_requested(:post, endpoint, times: 1) do |req|
        assert_equal MultiJson.dump(request), req.body
        assert_equal headers, req.headers
      end

      response.must_be_instance_of OpenRTB::Response
    end
  end
end