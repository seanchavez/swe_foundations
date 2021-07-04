class Flight
  def initialize(flt_nm, cap)
    @flight_number = flt_nm
    @capacity = cap
    @passengers = []
  end

  attr_reader :passengers

  def full?
    @passengers.length == @capacity
  end

  def board_passenger(passenger)
    unless self.full?
     @passengers << passenger if passenger.has_flight?(@flight_number)
    end
  end

  def list_passengers
    @passengers.map {|pass| pass.name}
  end

  def [](index)
    @passengers[index]
  end

  def <<(passenger)
    self.board_passenger(passenger)
  end
end