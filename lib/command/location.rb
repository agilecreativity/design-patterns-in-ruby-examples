module Patterns
  module Command
    class Location
      attr_accessor :x, :y

      def initialize(x, y)
        @x = x
        @y = y
      end
    end
  end
end
