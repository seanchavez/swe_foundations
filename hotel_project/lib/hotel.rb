require_relative "room"

class Hotel
  def initialize(name, room_caps)
    @name = name
    @rooms = {}
    room_caps.each {|room, cap| @rooms[room] = Room.new(cap)}
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(rm_name)
    @rooms.has_key?(rm_name)
  end

  def check_in(person, rm_name)
    if self.room_exists?(rm_name)
      if @rooms[rm_name].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    else
      puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.any? {|room, _| !@rooms[room].full?}
  end

  def list_rooms
    @rooms.each {|room, _| puts room + ": " + @rooms[room].available_space.to_s}  
  end                          
end
