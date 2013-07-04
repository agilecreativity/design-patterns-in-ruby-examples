require_relative './spec_helper'

describe Driver do
  describe "When a cautious driver is on the road for 3 hours" do
    before(:each) do
      @granny = Driver.new(CautiousDrivingHabit.new)
      @granny.drive 3
    end

    it "should move a total of 165 miles" do
      @granny.miles_driven.should == 165
    end

    it "should not receive any speeding tickets" do
      @granny.speeding_tickets.should == 0
    end
  end

  describe "When a reckless driver is on the road for 3 hours" do
    before(:each) do
      @speed_racer = Driver.new(RecklessDrivingHabit.new)
      @speed_racer.drive 3
    end

    it "should move a total of 240 miles" do
      @speed_racer.miles_driven.should == 240
    end

    it "should not receive a speeding ticket for every half hour on the road" do
      @speed_racer.speeding_tickets.should == 6
    end
  end

  # simplify strategy patterns using (block)
  # def drive_using_habit(hours, &driving_habit)
  #    driving_habit.call self, hours
  # end
end
