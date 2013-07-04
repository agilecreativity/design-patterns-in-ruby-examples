module Patterns
  module Strategy
    # see: http://en.wikipedia.org/wiki/Strategy_pattern
    class Context
      def initialize(strategy)
        @strategy = strategy
      end

      def execute(a,b)
        @strategy.execute(a,b)
      end
    end

    class Add
      def execute(a,b)
        a + b
      end
    end

    class Mult
      def execute(a,b)
        a * b
      end
    end
  end
end

if __FILE__ == $0
  include Patterns::Strategy
  puts Context.new(Add.new).execute(1,2)
  puts Context.new(Mult.new).execute(5,6)
end
