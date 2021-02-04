class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
      array.each do |peg|
        if !POSSIBLE_PEGS.keys.include?(peg.upcase)
          return false
        end
      end
     true
  end

  def initialize(array)
    @array = array
    if !Code.valid_pegs?(array)
      raise "Not Valid Pegs"
    else
      @pegs = array.map {|ele| ele.upcase}
    end
  end

  def pegs
    @pegs
  end

  def self.random(num)
    random = Code.new( Array.new(num) { POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(str)
    pegs = Code.new(str.upcase.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length 
    @pegs.length
  end

  def num_exact_matches(guess) 
    try = guess.pegs
    count = 0
    try.each_with_index do |g_peg, g_idx|
        if try[g_idx] == @pegs[g_idx] #possible bug, might be 
          count += 1
        end
    end
    count
  end

  def num_near_matches(guess)
    try = guess.pegs
    count = 0
    try.each_with_index do |g_peg, g_idx|
      if @pegs.include?(g_peg) && @pegs[g_idx] != g_peg
        count += 1
      end
    end
    count
  end

  def ==(instance)
    instance.pegs == self.pegs
  end
  
end


