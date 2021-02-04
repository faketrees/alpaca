def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array)
    array.sum / array.length.to_f
end

def repeat(str, num)
    new_str = ""
    num.times do
        new_str << str
    end
    new_str
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    new_str = str.split(" ").map.with_index do |word, i| 
                if i.even?
                    word.upcase
                else
                    word.downcase
                end
            end
    new_str.join(" ")
end
