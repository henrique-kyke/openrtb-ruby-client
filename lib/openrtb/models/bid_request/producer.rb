module OpenRTB
  module Models
    module BidRequest
      class Producer < OpenRTB::Models::Base
        attr_accessor :id, :name, :cat, :domain
      end
    end
  end
end
