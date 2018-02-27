require 'csv'
require_relative 'trip'

module RideShare
  class Driver
    attr_reader :id, :name, :vehicle_id

    def initialize(id, name, vin)
      if id == nil || id <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero. (got #{id})")
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
  end
end
