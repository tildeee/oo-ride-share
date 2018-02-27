require 'csv'
require_relative 'driver'
require_relative 'passenger'

module RideShare
  class Trip
    attr_reader :passenger_id, :driver_id, :rating, :id, :date, :cost, :duration_hhmmss

    def initialize(input)
      @id = input[:id]
      @driver_id = input[:driver_id]
      @passenger_id = input[:passenger_id]
      @date = input[:date]
      @rating = input[:rating]
      @cost = input[:cost]
      @duration_hhmmss = input[:duration_hhmmss]
    end

    def get_driver
      return Driver.find(@driver_id)
    end

    def get_passenger
      return Passenger.find(@passenger_id)
    end

    def self.all_for_driver(id)
      list_of_trips = []
      all_trips = Trip.all
      all_trips.each do |trip|
        list_of_trips << trip if trip.driver_id == id
      end
      return list_of_trips
    end

    def self.all_for_passenger(id)
      list_of_trips = []
      all_trips = Trip.all
      all_trips.each do |trip|
        list_of_trips << trip if trip.passenger_id == id
      end
      return list_of_trips
    end


  end
end
