class Dog
    attr_reader :name, :age    #get the name or age
    attr_writer :name, :age   #set the name or age
    attr_accessor :name #get and set the name
    


    def initialize(name, age)
        @name = name
        @age = age
    end


    def agecmp?(other_dog)
        if self.age > other_dog.age
            return self.age
        else
            return other_dog.age
        end
    end

end