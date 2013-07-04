module Patterns
  module Composite

    class CompositeComponent
      def initialize
        @tasks = []
      end

      def perform_task
        @tasks.each {|task| task.perform_task}
      end

      def add_task(task)
        @tasks << task
      end

      def remove_task(task)
        @tasks.delete task
      end
    end

    class DrainOldOilTask
      def perform_task
        puts "Draining old oil."
      end
    end

    class RemoveOldFilterTask
      def perform_task
        puts "Removing old filter."
      end
    end

    class InstallNewFilterTask
      def perform_task
        puts "Installing new filter."
      end
    end

    class ReplaceFilterTask < CompositeComponent
      def initialize
        super
        add_task RemoveOldFilterTask.new
        add_task InstallNewFilterTask.new
      end
    end

    class AddNewOilTask
      def perform_task
        puts "Adding new oil."
      end
    end

    class ChangeOil < CompositeComponent
      def initialize
        super
        add_task DrainOldOilTask.new
        add_task ReplaceFilterTask.new
        add_task AddNewOilTask.new
      end
    end

  end
end

if __FILE__ == $0
  include Patterns::Composite
  ChangeOil.new.perform_task
end

# sample output:
# -------------
# Draining old oil.
# Removing old filter.
# Installing new filter.
# Adding new oil.
