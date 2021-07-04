class Passenger
  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  attr_reader :name

  def has_flight?(flt_nm)
    @flight_numbers.include?(flt_nm.upcase)
  end

  def add_flight(flt_nm)
    @flight_numbers << flt_nm.upcase unless self.has_flight?(flt_nm)
  end
end