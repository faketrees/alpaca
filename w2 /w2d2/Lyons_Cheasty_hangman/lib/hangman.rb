class Hangman 
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  HANGMAN_PICS =[
                      '
                    +---+
                    |   |
                        |
                        |
                        |
                        |
                  =========', '
                    +---+
                    |   |
                    O   |
                        |
                        |
                        |
                  =========', '
                    +---+
                    |   |
                    O   |
                    |   |
                        |
                        |
                  =========', '
                    +---+
                    |   |
                    O   |
                   /|   |
                        |
                        |
                  =========', '
                    +---+
                    |   |
                    O   |
                   /|\  |
                        |
                        |
                  =========', '
                    +---+
                    |   |
                    O   |
                   /|\  |
                   /    |
                        |
                  =========', '
                    +---+
                    |   |
                    O   |
                   /|\  |
                   / \  |
                        |
                  =========']

  attr_reader :random_word, :secret_word, :attempted_chars, :remaining_incorrect_guesses, :guess_word
  attr_writer :secret_word, :random_word, :attempted_chars, :remaining_incorrect_guesses, :guess_word

  def self.random_word
     DICTIONARY.sample
  end

  def initialize#(random_word)
    # @secret_word = DICTIONARY[rand(0..DICTIONARY.length)]
    @random_word = Hangman.random_word 
    @secret_word = @random_word 
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    #iterate through the 
    #don't use .select
    indices = []
    @secret_word.each_char.with_index { |letter, i| indices << i if letter == char }
    indices
  end

  def fill_indices(char, indices)
   indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      false
    else 
      @attempted_chars << char
      if @secret_word.include?(char)
        fill_indices(char, get_matching_indices(char))
      else
        @remaining_incorrect_guesses -= 1
        puts HANGMAN_PICS.reverse[@remaining_incorrect_guesses]
      end
      true
    end
  end

  def ask_user_for_guess 
    puts 'Enter a char:'
    input = gets.chomp 
    try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      true 
    else
      false 
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      true 
    else
      false
    end
  end

  def game_over?
    if win? || lose? 
      puts @secret_word
      true
    else
      false 
    end
  end
end




 