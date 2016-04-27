require 'digest'
module OpenRTB
  module Models
    module BidRequest
      class Pmp < OpenRTB::Models::Base
        attr_accessor :private_auction, :deals
      end

      class Deal < OpenRTB::Models::Base
        attr_reader :id
        attr_accessor :bidfloor, :bidfloorcur, :at, :wseat, :wdomain

        def initialize(args={})
          super(args)
          @id = Digest::MD5.hexdigest((rand+Time.now.to_f).to_s)
          @bidfloor ||= 0
          @bidfloorcur ||= "USD"
        end
      end
    end
  end
end
