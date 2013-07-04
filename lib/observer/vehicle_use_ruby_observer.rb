module Patterns
  module Observer
    # Use of built in class
    require "observer"
    class Vehicle
      include Observable

      attr_reader :mileage, :mileage_at_last_oil_change

      def initialize
        @mileage = 0
        @mileage_at_last_oil_change = 0
        @observers = []
      end

      def drive(miles)
        @mileage += miles
        changed
        notify_observers self
      end

      def miles_until_next_oil_change
        3000 - (@mileage - @mileage_at_last_oil_change)
      end

      def perform_oil_change
        @mileage_at_last_oil_change = @mileage
        changed
        notify_observers self
      end
    end

    class Dashboard
      attr_reader :message

      def initialize
        @message = ""
      end

      def update(vehicle)
        @message = vehicle.miles_until_next_oil_change <= 0 ?
                    "Time for an oil change!" :
                    "Next oil change is due in #{vehicle.miles_until_next_oil_change} miles."
      end
    end
  end
end

if __FILE__ == $0
  include Patterns::Observer
  dashboard = Dashboard.new
  vehicle = Vehicle.new

  vehicle.add_observer dashboard

  vehicle.drive 2000
  puts dashboard.message

  vehicle.drive 1500
  puts dashboard.message

  vehicle.perform_oil_change
  puts dashboard.message

  vehicle.drive 1000
  puts dashboard.message
end

# Sample output:
# Next oil change is due in 1000 miles.
# Time for an oil change!
# Next oil change is due in 3000 miles.
# Next oil change is due in 2000 miles.
