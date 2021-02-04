#required animal and other files
require_relative "./animals/dog.rb"
require_relative "./animals/cat.rb"



class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end



hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

dog_1 = Dog.new("Wally")
dog_2 = Dog.new("Felicia")

hotel.check_in(cat_1)
hotel.check_in(cat_2)

hotel.check_in(dog_1)
hotel.check_in(dog_2)

p hotel