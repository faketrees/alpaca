class Cat #note that cat is capitalized
  @@furry = true

  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def name
    @name
  end

  def color
    @color
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def meows_at(person)
    puts "#{@name} meows at #{person}"
  end

  def self.shaved
    furry = false
  end



end


cat_1 = Cat.new("ruby", "grey", 4) #have to define the cat class with the .new call

p cat_1
p cat_1.name
p cat_1.color
p cat_1.age

cat_1.age = 6
p cat_1.age

cat_1.age=(8)
p cat_1.age




class Require_relative

  def home 
    
  end

end