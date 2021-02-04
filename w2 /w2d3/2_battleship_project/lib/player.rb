class Player

    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        input = gets.chomp
        array = input.split(" ")
        array.map! { |el| el.to_i }
    end


end
