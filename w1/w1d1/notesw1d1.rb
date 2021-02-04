#any?
#all?
#none?
#count
#flatten
#symbol vs string
#index?
LINES = ("-" * 40)
str = "Hello"
print str
puts
print :Hi
puts
puts LINES



def test(blah, bluh, *bleh)
    p blah
    p bluh
    p bleh
end


arg = ["a","c"]

p test(*arg) #why does this print "c" twice because c becomes bluh and bleh


def find_longest(arr)

    arr.inject do |acc, el|
        if el.length < acc.length
            acc =acc
        else
            acc = el
        end
    end
end

words = ["Things", "stuff", "people", "Strings"]
puts LINES

p find_longest(words)
puts LINES

#.object_id gives memory location
#strings generate new object ID
#symbols stay and are forever in the same memory block

puts str.object_id
puts str.object_id



def peak_finder(arr)
    peaks = []
    (0...arr.length - 1).each_with_index do |num, i|
        prev_num = arr[i - 1]
        next_num = arr[i + 1]
        if num > next_num && num > prev_num
            peaks << num
        end
    end
 return peaks
end



#saving for later
#new_string = ""
#string_array = str.split("")
#chars = str.split("").unique # => [a, b, c]
# chars.each do |ele| 
#   new_string += str.count(ele) + ele
# end


# saving for later


