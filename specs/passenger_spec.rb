require_relative 'spec_helper'
# require_relative '../lib/passenger'
# require_relative '../lib/driver'
# require_relative '../lib/trip'

describe "Passenger class" do

  it "is an instance of RideShare::Passenger" do
    test_rider = RideShare::Passenger.new({id: 1, name: "Smithy", phone_number: "353-533-5334"})
    test_rider.must_be_kind_of RideShare::Passenger
  end

  describe "get_trips method" do
    before do
      @rider = RideShare::Passenger.new(id: 9, name: "Merl Glover III", phone_number: "1-602-620-2330 x3723")
    end
    it "returns an array of trips" do
      @rider.get_trips.must_be_kind_of Array
    end
    it "each item in array is a Trip instance" do
      @rider.get_trips.each do |trip|
        trip.must_be_kind_of RideShare::Trip
      end
    end
    it "all Trips must have the same RideShare::Passenger id" do
      @rider.get_trips.each do |trip|
        trip.passenger_id.must_equal 9
      end
    end
  end

  describe "get_drivers method" do
    before do
      @passenger = RideShare::Passenger.new(id: 9, name: "Merl Glover III", phone_number: "1-602-620-2330 x3723")
    end
    it "returns an array" do
      @passenger.get_drivers.must_be_kind_of Array
    end
    it "all items in array are Driver instances" do
      @passenger.get_drivers.each do |driver|
        driver.must_be_kind_of RideShare::Driver
      end
    end
  end

  describe "self.all method" do
    let(:passengers) {RideShare::Passenger.all}
    it "returns an array" do
      passengers.must_be_kind_of Array
    end
    it "all elements are RideShare::Passenger instances" do
      passengers.each do |passenger|
        passenger.must_be_kind_of RideShare::Passenger
      end
    end
    it "grabs first line of data from csv" do
      # test_passenger = nil
      test_passenger = passengers.find {|pass| pass.id == 1}
      test_passenger.must_be_kind_of RideShare::Passenger
    end
    it "grabs last line of data from csv" do
      # test_passenger = nil
      test_passenger = passengers.find {|pass| pass.id == 300}
      test_passenger.name.must_equal "Miss Isom Gleason"
    end
    it "grabs random middle line of data from csv" do
      # test_passenger = nil
      test_passenger = passengers.find {|pass| pass.id == 153}
      test_passenger.phone_number.must_equal "1-227-712-3316 x290"
    end
  end

  describe "self.find(id) method" do
    it "returns a Passenger instance" do
      RideShare::Passenger.find(1).must_be_kind_of RideShare::Passenger
    end
    it "Passenger's id matches the id passed in" do
      id = 1
      passenger = RideShare::Passenger.find(id)
      passenger.id.must_equal id
    end
    it "returns nil if no Driver found" do
      RideShare::Passenger.find(301).must_equal nil
    end
  end
end
