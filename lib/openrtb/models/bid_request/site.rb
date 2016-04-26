module OpenRTB
  module Models
    module BidRequest
      class Site < OpenRTB::Models::Base
        attr_accessor :id, :name, :domain, :cat, :sectioncat, :pagecat, :page, :ref, :search, :mobile, :privacypolicy,
                      :publisher, :content, :keywords

      end
    end
  end
end
