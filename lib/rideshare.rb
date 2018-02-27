module RideShare
  def id_check(id)
    if id == nil || id <= 0
      raise ArgumentError.new("ID cannot be blank or less than zero.")
    end
  end
end
