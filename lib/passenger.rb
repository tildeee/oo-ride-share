require_relative 'trip'

module RideShare
  class Passenger
    attr_reader :id, :name, :phone_number

    def initialize(input)
      @id = input[:id]
      @name = input[:name]
      @phone_number = input[:phone]
    end

    def get_trips
      return Trip.all_for_passenger(@id)
    end

    def get_drivers
      trips = get_trips
      drivers = trips.map{ |t| t.driver }
      return drivers
    end

    def self.all
      passengers = []

      CSV.read('support/passengers.csv').each do |line|
        input_data = {}
        input_data[:id] = line[0]
        input_data[:name] = line[1]
        input_data[:phone] = line[2]

        passengers << self.new(input_data)
      end

      return passengers
    end

    def self.find(id)
      all.select{|p| p.id == id }.first
    end
  end
end
