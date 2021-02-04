require "byebug"
def range(start, last)
    #returns an array of all numbers in that range exclusive
    return [start] if last - start == 1 #range(1,3)
    return [] if start >= last
    
    [start] + range(start+1,last) # (range(2,3))
end


p range(1, 5) # => [1,2,3,4]
p range(3,2)  #=> []
p range(1,1) #=> [] because exclusive
p range(1,3) #=> [1,2]


puts
puts "-" * 30 + "SUM" + "-" * 30
puts

def sum_arr(arr)
    return arr[0] if arr.length == 1
    return 0 if arr.length == 0

    arr[0] + sum_arr(arr[1..-1])
end


p sum_arr([1,2,3])
p sum_arr([])
p sum_arr([-1, -2 , -3])

puts
puts "-" * 30 + "EXP1" + "-" * 30
puts




def exp1(base, exp)
  return 1 if exp == 0
  return base if exp == 1
  if exp > 0
    base * exp1(base, exp-1)
  else
    1.0/base * exp1(base, exp+1)
  end
  
end

p exp1(2,2) #4
p exp1(1,1) #1
p exp1(2,8) #256
p exp1(0,0) #1
p exp1(-2,3) #-8
p exp1(-2,-3) #-0.125

puts
puts "-" * 30 + "EXP2" + "-" * 30
puts

$signpost = 1

def exp2(base, exp) #2, 3
        return 1 if exp == 0
        return base if exp == 1
        return (base * base)if exp == 2
        if exp.odd?
            puts " #{$signpost} base: #{base}; exp: #{exp}"
            $signpost += 1
            base * exp2( exp2(base, (exp - 1) / 2), 2 ) #2 * 4 8
    
        else
            puts " #{$signpost} base: #{base}; exp: #{exp}"
            $signpost += 1
            exp2( exp2(base, exp/2), 2) #2 * 64
    
        end

end

 p exp2(2,5)  #32
#  exp2(2,2) #4
#  exp2(1,1) #1
#  exp2(2,6) #64
#  exp2(2,7) #128
#  exp2(2,8) #256
#  exp2(0,0) #1

class Array 
  def deep_dup
    return [] if self.length == 0
    return_arr = []
    self.each.with_index do |sub_arr, i|
      if self[i].is_a?(Array)
        return_arr << sub_arr.deep_dup
      else
        return_arr << self[i]
      end
    end
    return_arr
    #do += so we can concat and reassign, make sure each subarray is a different location in memory
    #iterate over each of the subarrs
    #reassign to itself
    #when .dup is called on a full array it changes the object id
    #call .dup on all subarrays until the function no longer returns an array
  end
end

puts
puts "-" * 30 + "NUMS_DUP" + "-" * 30
puts

sub_numbers = [[1], [2], [3]]
changed = sub_numbers.deep_dup
changed[0][0] = [1]
p changed     # [[[1]], [2], [3]]
p sub_numbers #[[1], [2], [3]]

#.dup vs. .clone?
#.dup and clone both do shallow duplication

#a shallow dup: will not duplicate SUB ARRAYS in an array. it will give the overarching array a new memory address 
#when you do a dupe on 
# nums = [1,2,3]
# p "nums object id:        #{nums.object_id}"
# p "nums_dup:              #{nums_dup = nums.dup}"
# p "nums_dup.object_id:    #{nums_dup.object_id}"
# p "nums_clone:            #{nums_clone = nums.clone}"
# p "nums_clone.object_id:  #{nums_clone.object_id}"

puts
puts "-" * 30 + "ALPHA_DUP" + "-" * 30
puts


alpha = [["a", "b", "c"], ["d", "e", "f"]]
alpha_dup = alpha.dup
alpha_clone = alpha.clone
alpha_deep_dup = alpha.deep_dup
alpha_deep_dup[0] = "banana"
alpha_deep_dup[1][0] = "dog"
p alpha_deep_dup #["banana", ["dog", "e", "f"]]should contain banana and dog
p alpha #should not contain banana or dog


puts
puts "-" * 30 + "FIB" + "-" * 30
puts

def fib(n) #fib(3)
  return [1] if n == 1
  return [1,1] if n == 2 #
  return [] if n == 0
  last_fib = fib(n-1) #[1,1]
  last_fib_num = last_fib[-1] + last_fib[-2] #
  last_fib << last_fib_num
  
end

p fib(1) #[1]
p fib(2) #[1,1]
p fib(0) #[]
p fib(3) #[1,1,2]
p fib(7)

puts
puts "-" * 30 + "BINARY" + "-" * 30
puts


def bsearch(array, target)   
    m_idx = array.length / 2 #middle index
    return m_idx if array[m_idx] == target
    return nil unless array.include?(target)
    if target > array[m_idx]
       return m_idx + 1 + bsearch(array[m_idx + 1..-1], target)
    else
        if array.length.odd?
            return bsearch(array[0..m_idx], target)
        else
            return bsearch(array[0...m_idx], target) 
        end
    end
    
end


p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2

p bsearch([1, 3, 4, 5, 9], 5) # => 3

p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5

p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

puts
puts "-" * 30 + "Merge" + "-" * 30
puts

MAX_STACK_SIZE = 200
tracer = proc do |event|
  if event == 'call' && caller_locations.length > MAX_STACK_SIZE
    fail "Probable Stack Overflow"
  end
end
set_trace_func(tracer)

def merge_sort(arr) #arr = [38,27,43,4]                   [38, 27]
  return [] if arr.length == 0
  return arr if arr.length == 1
  m_idx = (arr.length / 2) #m_idx = 2                     m_idx = 1
  first_half = arr[0...m_idx] #first_half = [38, 27]      first_half = [38]
  second_half = arr[m_idx..-1] #second_half = [43, 4]     second_half = [27]
  first = merge_sort(first_half)#[27, 38]                 #[38]
  second = merge_sort(second_half)#[4, 43]                        #[27]
  merge(first, second)
end

def merge(first, second) #[4, 27], [43, 38]
    ordering = []
    ordering += first if second == []
    if first.shift > second.shift        #first = [27] first.shift = 4 second =[38] second.shift = 43
      ordering.concat([second[0]],[first[0]])
    else
      ordering.concat([first,[second[0]]) # ordering = [4,27,43] [38]
    end
    return merge(ordering, first[1..-1] + second[1..-1]) 
end

merge_sort([38,27,43,3,9,82,10])
p merge_sort([38,27,43,4])
p merge([38], [27])