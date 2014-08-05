require 'hashie'

module OpenRTB
  class Request < Hashie::Hash
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::IndifferentAccess
  end
end