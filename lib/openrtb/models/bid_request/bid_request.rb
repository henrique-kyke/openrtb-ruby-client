require 'digest'
module OpenRTB
  module Models
    module BidRequest
      class BidRequest < OpenRTB::Models::Base
        attr_accessor :imp, :site, :app, :device, :user, :test, :at, :tmax, :wseat, :allimps, :cur, :bcat, :badv, :regs
        attr_reader :id

        def initialize(args={})
          @id = Digest::MD5.hexdigest((rand + Time.now.to_f).to_s)
          super(args)
          @test = args[:test] ||= 0
          @cur = args[:cur] ||= ["USD"]
        end
      end
    end
  end
end
