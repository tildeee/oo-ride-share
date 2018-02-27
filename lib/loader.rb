require 'csv'

require_relative 'driver'

module RideShare
  class Loader
    # DRIVER_FILE = 'support/drivers.csv'

    def self.load_drivers
      my_file = CSV.open('support/drivers.csv', headers: true)

      all_drivers = []
      my_file.each do |line|

        # Set to a default value
        vin = line[2].length == 17 ? line[2] : "0" * 17

        all_drivers << Driver.new(line[0].to_i, line[1], vin)
      end

      return all_drivers
    end

    def self.load_passengers
      passengers = []

      CSV.read('support/passengers.csv', headers: true).each do |line|
        input_data = {}
        input_data[:id] = line[0].to_i
        input_data[:name] = line[1]
        input_data[:phone] = line[2]

        passengers << self.new(input_data)
      end

      return passengers
    end

    def self.load_trips
      my_file = CSV.open("support/trips.csv", headers: true)
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
