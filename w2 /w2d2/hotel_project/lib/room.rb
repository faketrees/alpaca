class Room

    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = [] 
    end

    def full?
        @occupants.count < @capacity ? false : true
    end

    def available_space
        @capacity - @occupants.count
    end

    def add_occupant(kevin)
        full? ? false : (@occupants << kevin; true) #OMG THEY KILLED KEVIN THOSE BASTARDS      
    end

    

end
