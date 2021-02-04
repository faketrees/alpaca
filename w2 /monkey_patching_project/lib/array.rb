# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        self.max - self.min if self.length > 0
    end

    def average
        (self.sum.to_f / self.length) if self.length > 0
    end














    def my_transpose
        self.each_with_index do |subarray, idx1|
            self.each_with_index do |num, idx2|
                if idx2 < idx1
                    self[idx1][idx2] , self[idx2][idx1] = self[idx2][idx1], self[idx1][idx2]
                end
            end
        end
    end


#accessing the array by self[idx1][idx2] and transposing it

#[a, b, c] # [0][0], [0][1], [0][2]
#[d, e, f] # [1][0], [1][1], [1][2] # before
#[g, h, i] # [2][0], [2][1], [2][1]

#[a, d, g] # [0][0], [0][1], [0][2]
#[b, e, h] # [1][0], [1][1], [1][2] # after
#[c, f, i] # [2][0], [2][1], [2][1]


#the first bit is the 2d array laid out in a matrices/grid format,
#the second is the 'coordinates' IE 'a' is at [0][0] the first array, the first element
#b is at 'coordinate' [0][1] before and 'coordinate' [1][0] after

end
