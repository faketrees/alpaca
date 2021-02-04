require_relative "room"

class Hotel
    
    attr_reader :rooms

    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name
      words = @name.split
      words.map! { |el| el.capitalize }.join(" ")
    end

    def room_exists?(str)
      @rooms.has_key?(str)
    end

    def check_in(person, room)
      if room_exists?(room)
        @rooms[room].add_occupant(person) ? puts("check in successful") : puts('sorry, room is full')
      else  
        puts "sorry, room does not exist"
      end
    end

    def has_vacancy?
      @rooms.keys.each { |room| return true if !@rooms[room].full?  }
      false
    end

    def list_rooms
        @rooms.keys.each { |room| puts "#{room} #{@rooms[room].available_space}"}
    end
end


