require 'csv'
require_relative 'driver'
require_relative 'passenger'

module RideShare
  class Trip
    attr_reader :passenger, :driver, :rating, :id, :date, :cost, :duration_hhmmss

    def initialize(input)
      @id = input[:id]
      @driver = input[:driver]
      @passenger = input[:passenger]
      @date = input[:date]
      @rating = input[:rating]
      @cost = input[:cost]
      @duration_hhmmss = input[:duration_hhmmss]
    end
  end
end
