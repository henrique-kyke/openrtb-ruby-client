module OpenRTB
  module Models
    module BidRequest
      class User < OpenRTB::Models::Base
        attr_accessor :id, :buyerid, :yob, :gender, :keywords, :customdata, :geo, :data
      end

      class Data < OpenRTB::Models::Base
        attr_accessor :id, :name, :segment
      end

      class Segment < OpenRTB::Models::Base
        attr_accessor :id, :name, :value
      end
    end
  end
end
