require "byebug"

def hipsterfy(str)
    vowels = "aeiou"

    i = str.length - 1
    while i >= 0
        if vowels.include?(str[i])
            str = str[0...i] + str[i+1..-1]
            break
        end
        i -= 1
    end
    str
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    str.downcase.each_char do |char|
        hash[char] += 1 if vowels.include?(char)
    end
    hash
end

def caesar_cipher(str, num)
    alphabet = ("a".."z").to_a
    new_str = ""
    str.each_char do |char|
        if alphabet.include?(char)
            old_index = alphabet.index(char)
            new_index = old_index + num
            new_char = alphabet[new_index % 26]
            new_str << new_char
        else
            new_str << char
        end
    end
    new_str
end
