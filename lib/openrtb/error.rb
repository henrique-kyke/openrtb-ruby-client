require 'nesty'

module OpenRTB
  class Error < Nesty::NestedStandardError
    class << self
      def errors
        @errors ||= {
          400 => OpenRTB::Error::BadRequest,
          401 => OpenRTB::Error::Unauthorized,
          403 => OpenRTB::Error::Forbidden,
          404 => OpenRTB::Error::NotFound,
          406 => OpenRTB::Error::NotAcceptable,
          408 => OpenRTB::Error::RequestTimeout,
          420 => OpenRTB::Error::EnhanceYourCalm,
          422 => OpenRTB::Error::UnprocessableEntity,
          500 => OpenRTB::Error::InternalServerError,
          502 => OpenRTB::Error::BadGateway,
          503 => OpenRTB::Error::ServiceUnavailable,
          504 => OpenRTB::Error::GatewayTimeout,
        }
      end
    end

    JsonError           = Class.new(self)
    ClientError         = Class.new(self)
    BadRequest          = Class.new(ClientError)
    Unauthorized        = Class.new(ClientError)
    Forbidden           = Class.new(ClientError)
    NotFound            = Class.new(ClientError)
    NotAcceptable       = Class.new(ClientError)
    RequestTimeout      = Class.new(ClientError)
    UnprocessableEntity = Class.new(ClientError)
    ServerError         = Class.new(self)
    InternalServerError = Class.new(ServerError)
    BadGateway          = Class.new(ServerError)
    ServiceUnavailable  = Class.new(ServerError)
    GatewayTimeout      = Class.new(ServerError)
  end
end