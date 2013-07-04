# be required by other classes
module Patterns
  module Strategy
    class Driver
      attr_accessor :driving_habit,
                    :miles_driven,
                    :speeding_tickets

      def initialize(driving_habit)
        @driving_habit = driving_habit
        @miles_driven  = 0
        @speeding_tickets = 0
      end

      def drive(hours)
        @driving_habit.drive self, hours
      end
    end

    class CautiousDrivingHabit
      def drive(driver, hours)
        driver.miles_driven += hours * 55
      end
    end

    class RecklessDrivingHabit
      def drive(driver, hours)
        driver.miles_driven += hours * 80
        driver.speeding_tickets += hours * 2
      end
    end
  end
end

if __FILE__ == $0
  include Patterns::Strategy
  d = Driver.new(CautiousDrivingHabit.new)
  p d.drive 3
end
