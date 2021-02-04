def all_divisible_nums(num, divisor)
    return [] if num < divisor
    return [num] if num == divisor #this declares a new array of [num] so we can shovel in to it

    if all_divisible_nums(num, divisor) != 0
        all_divisible_nums(num -1, divisor)
    else
        all_divisible_nums(num, divisor) << num #this shovels into the [num] array because of the return on line 3 and scope gates mean it is all the same object
    end
end


#https://ds055uzetaobb.cloudfront.net/brioche/uploads/yIDUdzv0wQ-pascals-triangle-6-choose-2.png?width=1200
#example of the triangle
#the length of the row is 1 less than the row

def pascal_row(n)
    return [1] if n == 0

    new_row = [1]

    prev_row = pascal_row(n-1)

    i = 0 
    while i < prev_row.length - 1
        new_row << prev_row[i] + prev_row[i +1]
        i += 1
    end

    new_row << 1
end


# p pascal_row(32)

def print_signpost(n)
    p "this is step #{n}"
end


$signpost = 1

def exp2(base, exp) #2, 3
        return 1 if exp == 0
        return base if exp == 1
        return (base * base)if exp == 2
        if exp.odd?
            puts " #{$signpost} base: #{base}; exp: #{exp}"
            return base * exp2( exp2(base, (exp - 1) / 2), 2 ) #2 * 4 8
    
        else
            # puts " #{$signpost} base: #{base}; exp: #{exp}"
            return exp2( exp2(base, exp/2), 2) #2 * 64   
        end
        $signpost += 1

end

p exp2(2,6)  #64
# p exp2(2,2) #4
# p exp2(1,1) #1
# p exp2(2,6) #64
# p exp2(2,7) #128
# p exp2(2,8) #256
# p exp2(0,0) #1

