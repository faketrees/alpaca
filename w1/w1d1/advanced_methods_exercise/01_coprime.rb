# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
def factors(num)
    factors = []
    (1..num).each do |ele|
        if num % ele == 0
            factors << ele  
        end
    end
    return factors 
end
def coprime?(num_1, num_2)
    factors1 = factors(num_1)
    factors2 = factors(num_2)
    commondiv1 = true
    factors1.each do |ele|
        if factors2.include?(ele) && ele != 1
            commondiv1 = false 
        end
    end
    return commondiv1
end
p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
