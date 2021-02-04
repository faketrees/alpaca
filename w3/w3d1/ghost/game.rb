require_relative "player.rb"
require 'set'

# require "dictionary.txt"
# to read txt file

class Game
    file = File.open("dictionary.txt")
    file_data = file.readlines.map(&:chomp)
    DICTIONARY = Set.new(file_data)
    file.close #--> to free up memory

    attr_reader :current_player
    attr_accessor :fragment

    def initialize
        @player_1 = Player.new
        @player_2 = Player.new
        @fragment = ""
        @dictionary = DICTIONARY
        @current_player = @player_1
        @lose = false
    end
    
    def play_round
        #player_1 takes a turn, adds a letter to the fragment. 
        #@current_player goes to player 2 then player 2 adds a fragment. 
        #if you input a non-valid letter you lose
        puts "#{@current_player} is the current player"
        while !lose?
            take_turn
        end
    end


    
    def take_turn #this is incomplete, still need to switch turns
    input = gets.chomp
    alphabet = [*("a".."z")]
    @fragment += input
        if @dictionary.include?(@fragment)
            puts "#{@current_player} loses"
            @lose = true
        end
        
    end

end

p set