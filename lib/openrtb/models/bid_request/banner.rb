module OpenRTB
  module Models
    module BidRequest
      class Banner < OpenRTB::Models::Base

        attr_accessor :id, :w, :h, :wmax, :hmax, :wmin, :hmin, :btype, :battr, :pos, :mimes, :top_frame, :expdir, :api

        def initialize(args={})
          super(args)
          @id ||= 1
          @pos ||= 0
          @top_frame ||= 0
        end
      end
    end
  end
end
