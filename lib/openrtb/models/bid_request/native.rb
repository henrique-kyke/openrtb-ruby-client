module OpenRTB
  module Models
    module BidRequest
      class Native < OpenRTB::Models::Base
        attr_accessor :request, :ver, :api, :battr
      end
    end
  end
end
