def select_even_nums(array)
    array.select { |num| num.even? }
end

def reject_puppies(array)
    array.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count { |sub| sub.sum > 0}
end

def aba_translate(str)
    #str.split("").map { |char| "aeiou".include?(char) ? char + "b" + char : char }.join("")
    new_str = str.split("").map do |char|
        if "aeiou".include?(char)
            char + "b" + char
        else
            char
        end
    end
    new_str.join("")
end

def aba_array(array)
    array.map { |word| aba_translate(word)}
end
