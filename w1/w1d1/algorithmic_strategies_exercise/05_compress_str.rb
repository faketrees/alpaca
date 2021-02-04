# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".


def compress_str(str)



end



p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"


# def compress_str(str) #doesn't work when characters are repeated seperated by other characters
#     new_string = ""
#     string_array = str.split("")
#     chars = str.split("").uniq # => [a, b, c]

#         chars.each do |ele| 
#             if str.count(ele) > 1
#                 new_string += str.count(ele).to_s + ele
#             else
#                 new_string += ele
#             end

#         end
#     return new_string
# end