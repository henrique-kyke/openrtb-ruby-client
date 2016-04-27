module OpenRTB
  module Models
    class Base
      attr_accessor :ext
      def initialize(args={})
        args.each { |k,v| self.send(k.to_s+"=",v)}
      end
    end
  end
end
