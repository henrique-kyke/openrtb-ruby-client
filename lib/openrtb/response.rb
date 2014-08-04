require 'hashie'

module OpenRTB
  class Response < Hashie::Hash
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::IndifferentAccess
  end
end