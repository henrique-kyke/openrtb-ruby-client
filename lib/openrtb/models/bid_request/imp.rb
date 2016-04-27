require 'digest'
module OpenRTB
  module Models
    module BidRequest
      class Imp < OpenRTB::Models::Base
        attr_reader :id
        attr_accessor :banner, :video, :native, :displaymanager, :displaymanagerver, :instl, :tagid, :bidfloor, :bidfloorcur,
                      :secure, :iframebuster, :pmp

        def initialize(args={})
          super(args)
          @id = Digest::MD5.hexdigest((rand+Time.now.to_f).to_s)
          @bidfloorcur ||= "USD"
          @secure ||= 0
        end
      end
    end
  end
end
