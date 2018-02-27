require_relative 'trip'

module RideShare
  class Passenger
    attr_reader :id, :name, :phone_number

    def initialize(input)
      if input[:id] == nil || input[:id] <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero.")
      end

      @id = input[:id]
      @name = input[:name]
      @phone_number = input[:phone]
    end

    def get_trips
      return Trip.all_for_passenger(@id)
    end

    def get_drivers
      trips = get_trips
      drivers = trips.map{ |t| t.get_driver }
      return drivers
    end

    def self.all
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

    def self.find(id)
      if id == nil || id <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero.")
      end

      self.all.find { |pass| pass.id == id }
    end
  end
end
