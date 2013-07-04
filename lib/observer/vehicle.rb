module Patterns
  module Observer
    class Vehicle
      attr_reader :mileage, :mileage_at_last_oil_change

      def initialize
        @mileage = 0
        @mileage_at_last_oil_change = 0
        @observers = []
      end

      def drive(miles)
        @mileage += miles
        notify_observers
      end

      def miles_until_next_oil_change
        3000 - (@mileage - @mileage_at_last_oil_change)
      end

      def perform_oil_change
        @mileage_at_last_oil_change = @mileage
        notify_observers
      end

      def add_observer(observer)
        @observers << observer
      end

      private

      def notify_observers
        @observers.each {|observer| observer.notify self}
      end
    end
  end
end

module Patterns
  module Observer
    class Dashboard
      attr_reader :message

      def initialize
        @message = ""
      end

      def notify(vehicle)
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

# output: =>
# Next oil change is due in 1000 miles.
# Time for an oil change!
# Next oil change is due in 3000 miles.
# Next oil change is due in 2000 miles.
