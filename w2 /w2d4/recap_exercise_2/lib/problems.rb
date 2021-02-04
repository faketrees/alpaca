# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    #if not the smaller num is not a factor of the bigger num
    #we need to find the greatest common factor
    #and multiply bigger num by greatest common factor
    # common_factors = []
    # smaller_factors = (1..num_1).select { |n| num_1 % n == 0 }
    # larger_factors = (1..num_2).select { |n| num_2 % n == 0 }
    # p smaller_factors
    # p larger_factors
    # common_factors = 
    num_1.lcm(num_2)
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)

    new_hash = Hash.new(0)
    str.each_char.with_index do |ele, i|
        if i < (str.length - 1)
            new_hash[ele + str[i +1]] += 1
        end
    end
    # p new_hash.values.max
    new_hash.each do |k, v|
        if new_hash.values.max == v
            return k
        end
    end

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = []
        self.each_with_index do |ele1, i1|
            self.each_with_index do |ele2, i2|
                if i1 < i2
                    pairs << [ele1, ele2]
                end
            end
        end
        pairs.count { |ele| ele.sum == num }
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        # <=>
        # a <=> b ( -1 means a is less than b)
        sorted = false
        while !sorted
            sorted = true
            (0...(self.length - 1)).each do |i|
                if (self[i] <=> self[i+1]) == -
            end




        end

    end
end
