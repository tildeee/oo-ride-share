require 'csv'
require_relative 'driver'
require_relative 'rider'

module RideShare
  class Trip
    attr_reader :rider_id, :driver_id, :rating, :id, :date, :cost, :duration_hhmmss

    def initialize(hash)
      @id = hash[:id]
      @driver_id = hash[:driver_id]
      @rider_id = hash[:rider_id]
      @date = hash[:date]
      @rating = hash[:rating]
      @cost = hash[:cost]
      @duration_hhmmss = hash[:duration_hhmmss]
    end

    def get_driver
      return Driver.find(@driver_id)
    end

    def get_rider
      return Rider.find(@rider_id)
    end

    def self.all_for_driver(id)
      list_of_trips = []
      all_trips = Trip.all
      all_trips.each do |trip|
        list_of_trips << trip if trip.driver_id == id
      end
      return list_of_trips
    end

    def self.all_for_rider(id)
      list_of_trips = []
      all_trips = Trip.all
      all_trips.each do |trip|
        list_of_trips << trip if trip.rider_id == id
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
        trip_hash[:rider_id] = line[2].to_i
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
