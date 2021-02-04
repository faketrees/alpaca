require_relative "human_player.rb"
require_relative "board.rb"

class Game


attr_reader :board, :player_1, :player_2, :player_1_mark , :player_2_mark
attr_writer :current_player

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @player_1_mark = player_1_mark
        @player_2_mark = player_2_mark
        @board = Board.new(3)
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
            p "Player 2"
        else
            @current_player = @player_1
            p "Player 1"
        end
        @board.print_grid
    end


    def play
        while @board.empty_positions?
            input = @current_player.get_position
            @board.place_mark(input, @current_player.mark)
            if @board.win?(@current_player.mark)
                return "#{@current_player} is the WINNER"
            end
            self.switch_turn
        end
        p "Draw"
    end



#test = Game.new(:X, :O) 
#test.play

end
