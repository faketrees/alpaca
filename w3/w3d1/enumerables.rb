class Array

    def my_each(&blk)
        i = 0
        while i < self.length
            blk.call(self[i])

            i += 1
        end
        self
    end
    
    def my_select(&blk)
        selected = []
        self.my_each {|ele| selected << ele if blk.call(ele)}
     
        selected
    end

    def my_reject(&blk)
        rejected = []
        self.my_each {|ele| rejected << ele if !blk.call(ele)}

        rejected
    end

    def my_any?(&blk)
        self.my_each { |ele| return true if blk.call(ele) } 
        false
    end
    
    def my_all?(&blk)
        self.my_each { |ele| return false if !blk.call(ele)}
        true
    end

    def my_flatten
        result = []
        # [ [1, 2], [2, 3]]
        return [self] if self.class != Array

        self.my_each do |ele| # ele.class != Array ? result << ele : result += ele.my_flatten
            if ele.class != Array
                result << ele
            else
                result += ele.my_flatten
            end
        end
        result
    end

    def my_zip(*args) 
        zipped = Array.new(self.length) {Array.new}
        self.each.with_index do |ele, self_idx| 
            zipped[self_idx] << ele
            args.each.with_index do |arg, arg_idx|
                zipped[self_idx] << arg[self_idx]
            end
        end
        zipped
    end

    def my_rotate(num = 1)
        rotated = self.clone
        if num > 0
            num.times do 
                rotated.push(rotated.shift)
            end
        else
            num.abs.times {rotated.unshift(rotated.pop)}
        end
        rotated
    end

    def my_join(str = "")
        new_str = ""
        
        i = 0
        while i < self.length
            if i != self.length - 1
                new_str += self[i].to_s + str
            else
                new_str += self[i].to_s
            end

            i += 1
        end
        
        new_str
    end

    def my_reverse
        reversed = []

        i = self.length - 1
        while i >= 0
            reversed << self[i]

            i -= 1
        end
        reversed
    end

    def factors

    end


end


arr.my_each do |el|
    p arr.my_each {|ele| p arr.my_each {|el| p el}}
end

#test code

 # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # # => 1
# #      2
# #      3
# #      1
# #      2
# #      3

# p return_value  # => [1, 2, 3]

# ---------------------------------
# my_select test case
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []
# p a
# 
# ---------------------------------
# #  my_reject test case
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
# p a

# my_any? and my_all test cases
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

#my_flatten test case
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


#my_zip test case
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# #my_rotate test case
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# # my_join test case
# p a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# my_reverse test case
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]