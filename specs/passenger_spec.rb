require_relative 'spec_helper'

describe "Passenger class" do

  it "is an instance of Passenger" do
    test_rider = RideShare::Passenger.new({id: 1, name: "Smithy", phone_number: "353-533-5334"})
    test_rider.must_be_kind_of RideShare::Passenger
  end

  describe "trips property" do
    before do
      @passenger = RideShare::Passenger.new(id: 9, name: "Merl Glover III", phone_number: "1-602-620-2330 x3723", trips: [])
      trip = RideShare::Trip.new({id: 8, driver: nil, passenger: @passenger, date: "2016-08-08", rating: 5})

      @passenger.add_trip(trip)
    end

    it "returns an array of trips" do
      @passenger.trips.must_be_kind_of Array
    end

    it "each item in array is a Trip instance" do
      @passenger.trips.each do |trip|
        trip.must_be_kind_of RideShare::Trip
      end
    end

    it "all Trips must have the same Passenger id" do
      @passenger.trips.each do |trip|
        trip.passenger.id.must_equal 9
      end
    end
  end

  describe "get_drivers method" do
    before do
      @passenger = RideShare::Passenger.new(id: 9, name: "Merl Glover III", phone_number: "1-602-620-2330 x3723")
      driver = RideShare::Driver.new(id: 3, name: "Lovelace", vin: "12345678912345678")
      trip = RideShare::Trip.new({id: 8, driver: driver, passenger: @passenger, date: "2016-08-08", rating: 5})

      @passenger.add_trip(trip)
    end

    it "returns an array" do
      drivers = @passenger.get_drivers
      drivers.must_be_kind_of Array
      drivers.length.must_equal 1
    end

    it "all items in array are Driver instances" do
      @passenger.get_drivers.each do |driver|
        driver.must_be_kind_of RideShare::Driver
      end
    end
  end
end
