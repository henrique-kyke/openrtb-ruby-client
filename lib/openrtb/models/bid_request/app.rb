module OpenRTB
  module Models
    module BidRequest
      class App < OpenRTB::Models::Base
        attr_accessor :id, :name, :bundle, :domain, :storeurl, :cat, :sectioncat, :pagecat, :ver , :privacypolicy,
                      :paid, :publisher, :content, :keywords
      end
    end
  end
end
