require 'digest'
module OpenRTB
  module Models
    module BidRequest
      class Content < OpenRTB::Models::Base
        attr_reader :id
        attr_accessor :episode, :title, :series, :season, :producer, :url, :cat, :videoquality, :context, :contentrating,
                      :userrating, :qagmediarating, :keywords, :livestream, :sourcerelationship, :len, :language, :embeddable

        def initialize(args={})
          super(args)
          @id = Digest::MD5.hexdigest((rand + Time.now.to_f).to_s)
        end
      end
    end
  end
end
