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

    def self.all
      my_file = CSV.open("support/trips.csv")
      trips = []
      prng = Random.new
      my_file.each do |line|
        trip_hash = {}
        trip_hash[:id] = line[0].to_i
        trip_hash[:driver_id] = line[1].to_i
        trip_hash[:passenger_id] = line[2].to_i
        trip_hash[:date] = line[3]
        trip_hash[:rating] = line[4].to_f if line[4].to_f >= 1 && line[4].to_f <= 5
        trip_hash[:cost] = prng.rand(20.01).round(2).to_f
        trip_hash[:duration_hhmmss] = "#{prng.rand(24).to_s.rjust(2, '0')}:#{prng.rand(60).to_s.rjust(2,'0')}:#{prng.rand(60).to_s.rjust(2,'0')}"

        trips << Trip.new(trip_hash)
      end

      return trips
    end
  end
end
