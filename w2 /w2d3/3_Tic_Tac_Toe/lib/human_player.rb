class HumanPlayer

attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p 'enter a position with row & col separated with a space like `0 1`'
        p @mark
        alphabet = [*("a".."z")]
        input = gets.chomp
        array = input.split(" ")
        if array.length != 2 
            raise "not enough args"
        else
            array.each do |arg|
                if [*('a'..'z')].include?(arg)
                    raise "enter numbers"
                end
            end
        end
        result = array.map! { |el| el.to_i }
    end


#[*('a'..'z')]
end
