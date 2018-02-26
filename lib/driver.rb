require 'csv'
require_relative 'trip'

module RideShare
  class Driver
    attr_reader :id, :name, :vehicle_id

    def initialize(id, name, vin)
      if id == nil || id <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero.")
      end

      @id = id
      @name = name
      @vehicle_id = vin
    end

    def get_trips
      trips = Trip.all_for_driver(@id)
      return trips
    end

    def average_rating
      trips = get_trips
      total_ratings = 0
      trips.each do |trip|
        total_ratings += trip.rating
      end
      average = total_ratings / trips.length

      return average
    end

    def self.all
      my_file = CSV.open('support/drivers.csv', headers: true)

      all_drivers = []
      my_file.each do |line|

        # Set to a default value
        vin = line[2].length == 17 ? line[2] : "0" * 17

        all_drivers << Driver.new(line[0].to_i, line[1], vin)
      end

      return all_drivers
    end

    def self.find(id)
      self.all.find{ |driver| driver.id == id }
    end
  end
end
