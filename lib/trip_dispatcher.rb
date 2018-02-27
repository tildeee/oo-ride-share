module RideShare
  class TripDispatcher
    def initialize
      @drivers = load_drivers
      @passengers = load_passengers
      @trips = load_trips
    end

    def load_drivers
      my_file = CSV.open('support/drivers.csv', headers: true)

      all_drivers = []
      my_file.each do |line|
        input_data = {}
        # Set to a default value
        vin = line[2].length == 17 ? line[2] : "0" * 17
        input_data[:vin] = vin
        input_data[:id] = line[0].to_i
        input_data[:name] = line[1]
        all_drivers << Driver.new(input_data)
      end

      return all_drivers
    end

    def find_driver(id)
      check_id(id)
      @drivers.find{ |driver| driver.id == id }
    end

    def load_passengers
      passengers = []

      CSV.read('support/passengers.csv', headers: true).each do |line|
        input_data = {}
        input_data[:id] = line[0].to_i
        input_data[:name] = line[1]
        input_data[:phone] = line[2]

        passengers << Passenger.new(input_data)
      end

      return passengers
    end

    def find_passenger(id)
      check_id(id)
      @passengers.find{ |passenger| passenger.id == id }
    end

    def load_trips
      my_file = CSV.open("support/trips.csv", headers: true)
      trips = []
      prng = Random.new
      my_file.each do |line|
        trip_hash = {}
        trip_hash[:id] = line[0].to_i
        driver_id = line[1].to_i
        passenger_id = line[2].to_i

        trip_hash[:driver] = find_driver(driver_id)
        trip_hash[:passenger] = find_passenger(passenger_id)

        trip_hash[:date] = line[3]
        trip_hash[:rating] = line[4].to_f if line[4].to_f >= 1 && line[4].to_f <= 5
        trip_hash[:cost] = prng.rand(20.01).round(2).to_f
        trip_hash[:duration_hhmmss] = "#{prng.rand(24).to_s.rjust(2, '0')}:#{prng.rand(60).to_s.rjust(2,'0')}:#{prng.rand(60).to_s.rjust(2,'0')}"

        trips << Trip.new(trip_hash)
      end

      return trips
    end

    private

    def check_id(id)
      if id == nil || id <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero. (got #{id})")
      end
    end
  end
end
