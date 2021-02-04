# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
# [[goat, action], [goat, tear], [goat, impromptu]]
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def check_word(arr)
    vowels = "aeiou"
    counts = Hash.new(0) 
    vowels.each_char { |vowel| counts[vowel] += 0 }

    arr.each do |word|
        word.each_char do |char|
            if counts.has_key?(char)
                counts[char] += 1
            end
        end
    end

    if counts.has_value?(0)
        return false
    else
        true
    end
end



def all_vowel_pairs(words)
    vowels = "aeiou"
    pairs = []
    words.each_with_index do |word1, idx1|
        words.each_with_index do |word2, idx2|
            if idx2 > idx1 
                pairs << [word1, word2]
            end
        end
    end

    pairs.select! do |pair|
        check_word(pair)
    end
    p pairs
    pairs.map do |subarray|
        subarray[0] + " " + subarray[1]
    end
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |factor|
        if num % factor == 0
            return true
        end
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    new_arr = []

    str.each_char.with_index do |char, i|
        if bigrams.include?(str[i..(i+1)]) 
            new_arr << str[i..(i+1)]
        end
    end

    bigrams.select! {|el| new_arr.include?(el)}

end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k, v| k == v }
        self.select { |k, v| prc.call(k, v) }
        # if prc == nil
        #     self.select { |k, v| k == v }
        # else
        #     self.select { |k, v| prc.call(k, v) }
        # end
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)

        new_arr = []
        (0...self.length).each do |start_index|
            (start_index...self.length).each do |end_index|
                new_arr << self[start_index..end_index] 
            end
        end
        length ? new_arr.select { |el| el.length == length} : new_arr
            
    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        new_str = ""
        alphabet = *("a".."z") #"abcdefghijklmnopqrstuvwxyz"
        self.each_char do |char|
            old_idx = alphabet.index(char)
            new_idx = old_idx + num 
            new_char = alphabet[new_idx % 26]
            new_str += new_char 
        end
        new_str 
    end
end
