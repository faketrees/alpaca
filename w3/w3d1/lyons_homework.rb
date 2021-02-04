def sum_to(n)
    return n if n < 0  
    n + sum_to(n-1)
end


p  sum_to(5)  # => returns 15
p  sum_to(1)  # => returns 1
p  sum_to(9)  # => returns 45
p  sum_to(-8)  # => returns nil

puts
puts "-" * 80
puts

def add_numbers(array)
    return array[0] if array.length <= 1
    array.shift + add_numbers(array)
end


p  add_numbers([1,2,3,4]) # => returns 10
p  add_numbers([3]) # => returns 3
p  add_numbers([-80,34,7]) # => returns -39
p  add_numbers([]) # => returns nil

puts
puts "-" * 80
puts

def gamma_fnc(n)
    return n if n < 1
    return 1 if n == 1
    (n-1) * gamma_fnc(n-1)
end

p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040

puts
puts "-" * 80
puts

def ice_cream_shop(flavors, favorite)
    return true if flavors[0] == favorite
    return false if flavors.length == 0
    flavors.shift
    ice_cream_shop(flavors, favorite)
end

p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false