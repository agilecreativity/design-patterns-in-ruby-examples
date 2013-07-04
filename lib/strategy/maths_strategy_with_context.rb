module Patterns
  module Strategy
    # see: http://en.wikipedia.org/wiki/Strategy_pattern
    class Context
      attr_reader :args
      def initialize(strategy, args)
        @strategy = strategy
        @args = args
      end

      def execute
        @strategy.execute(self)
      end
    end

    class Add
      def execute(context)
        context.args[:a] + context.args[:b]
      end
    end

    class Mult
      def execute(context)
        context.args[:a] * context.args[:b]
      end
    end

  end
end

if __FILE__ == $0
  include Patterns::Strategy
  c = Context.new Add.new, a: 1, b: 2
  puts c.execute #=> 3

  c = Context.new Mult.new, a: 3, b: 4
  puts c.execute #=> 12
end
