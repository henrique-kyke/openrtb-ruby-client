module OpenRTB
  module Models
    module BidRequest
      class Video < OpenRTB::Models::Base
        attr_accessor :mimes, :minduration, :maxduration, :protocols, :w, :h, :startdelay, :linearity, :sequence,
                      :battr, :maxextended, :minbitrate, :maxbitrate, :boxingallowed, :playbackmethod, :delivery,
                      :pos, :companionad, :api, :companiontype
        def initialize(args={})
          super(args)
          @pos ||= 0
        end
      end
    end
  end
end
