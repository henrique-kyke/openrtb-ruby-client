module OpenRTB
  module Models
    module BidRequest
      class Device < OpenRTB::Models::Base
        attr_accessor :ua, :geo, :dnt, :lmt, :ip, :ipv6, :devicetype, :make, :model, :os, :hwv, :h, :w, :ppi, :pxratio, :js,
                      :flashver, :language, :carrier, :connectiontype, :ifa, :didsha1, :didmd5, :macsha1, :macmd5
      end
    end
  end
end

