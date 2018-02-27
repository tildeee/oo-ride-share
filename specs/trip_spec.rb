require_relative 'spec_helper'

describe "Trip class" do

  it "is an instance of Trip" do
    test_trip = RideShare::Trip.new({id: 1, passenger_id: 33, driver_id: 22, date: "01-02-0102", rating: 5})
    test_trip.must_be_kind_of RideShare::Trip
  end

  describe "get_driver method" do
    before do
      @trip = RideShare::Trip.new({id: 8, driver_id: 93, passenger_id: 104, date: "2016-08-08", rating: 5})
    end
    it "returns an instance of Driver" do
      @trip.get_driver.must_be_kind_of RideShare::Driver
    end
    it "Driver's id matches driver_id on instance of Trip" do
      @trip.get_driver.id.must_equal 93
    end
  end

  describe "get_passenger method" do
    before do
      @trip = RideShare::Trip.new({id: 8, driver_id: 93, passenger_id: 104, date: "2016-08-08", rating: 5})
    end
    it "returns an instance of Passenger" do
      @trip.get_passenger.must_be_kind_of RideShare::Passenger
    end
    it "Passenger's id matches passenger_id on instance of Trip" do
      @trip.get_passenger.id.must_equal 104
    end
  end
end
