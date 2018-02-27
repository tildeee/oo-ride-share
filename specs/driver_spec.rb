require_relative 'spec_helper'

describe "Driver class" do

  describe "Driver instantiation" do
    it "is an instance of Driver" do
      test_driver = RideShare::Driver.new(id: 1, name: "George", vin: 3313)
      test_driver.must_be_kind_of RideShare::Driver
    end
    it "throws an argument error with a bad ID value" do
      proc{ RideShare::Driver.new(id: 0, name: "George", vin: 3313)}.must_raise ArgumentError
    end
    it "sets trips to an empty array if not provided" do
      test_driver = RideShare::Driver.new(id: 1, name: "George", vin: 3313)
      test_driver.trips.must_be_kind_of Array
      test_driver.trips.length.must_equal 0
    end
  end

  describe "add trip method" do
    before do
      @pass = RideShare::Passenger.new(id: 1, name: "Ada", phone: "412-432-7640")
      @driver = RideShare::Driver.new(id: 3, name: "Lovelace", vin: "12345678912345678")
      trip = RideShare::Trip.new({id: 8, driver: @driver, passenger: @pass, date: "2016-08-08", rating: 5})

      # @driver = RideShare::Driver.new(54, "Rogers Bartell IV", "1C9EVBRM0YBC564DZ")
    end

    it "throws an argument error if trip is not provided" do
      proc{ @driver.add_trip(1) }.must_raise ArgumentError
    end

    it "increases the trip count by one" do
      previous = @driver.trips.length
      @driver.add_trip(RideShare::Trip.new(id: 55, passenger: @pass, driver: @driver))
      @driver.trips.length.must_equal previous + 1
    end
  end

  describe "average_rating method" do
    before do
      @driver = RideShare::Driver.new(id: 54, name: "Rogers Bartell IV", vin: "1C9EVBRM0YBC564DZ")
      trip = RideShare::Trip.new({id: 8, driver: @driver, passenger: nil, date: "2016-08-08", rating: 5})
      @driver.add_trip(trip)
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
    it "returns zero if no trips" do
      driver = RideShare::Driver.new(id: 54, name: "Rogers Bartell IV", vin: "1C9EVBRM0YBC564DZ")
      driver.average_rating.must_equal 0
    end
  end
end
