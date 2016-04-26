module OpenRTB
  module Models
    module BidRequest
      class Geo < OpenRTB::Models::Base
        attr_accessor :lat, :lon, :type, :country, :region, :regionfips104, :metro, :city, :zip, :utcoffset
      end
    end
  end
end
