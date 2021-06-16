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
    
  end
end
