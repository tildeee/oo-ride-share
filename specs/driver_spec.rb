require_relative 'spec_helper'
# require_relative '../lib/driver'

describe "Driver class" do

  describe "Driver instantiation" do
    it "is an instance of Driver" do
      test_driver = RideShare::Driver.new(1, "George", 3313)
      test_driver.must_be_kind_of RideShare::Driver
    end
    it "throws an argument error with a bad ID value" do
      proc{ RideShare::Driver.new(0, "George", 3313)}.must_raise ArgumentError
    end
  end


  describe "get_trips method" do
    before do
      @driver = RideShare::Driver.new(1, "Bernardo Prosacco", "WBWSS52P9NEYLVDE9")
      @trips = RideShare::Trip.all_for_driver(@driver.id)
    end
    it "returns an array" do
      @trips.must_be_kind_of Array
    end
    it "all elements are Trip instances" do
      @trips.each do |trip|
        trip.must_be_kind_of RideShare::Trip
      end
    end
    it "all Trips in array have same driver_id as id passed in" do
      this_id = @driver.id
      @trips.each do |trip|
        trip.driver_id.must_equal this_id
      end
    end
  end

  describe "average_rating method" do
    before do
      @driver = RideShare::Driver.new(54, "Rogers Bartell IV", "1C9EVBRM0YBC564DZ")
    end
    it "returns a float" do
      @driver.average_rating.must_be_kind_of Float
    end
    it "float is >= 1.0" do
      average = @driver.average_rating
      average.must_be :>=, 1.0
    end
    it "float is <= 5.0" do
      average = @driver.average_rating
      average.must_be :<=, 5.0
    end
  end
end
