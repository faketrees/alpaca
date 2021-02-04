class Board

    attr_reader :grid, :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, '_')}
        @size = n * n
        @row_length = n
        @column_length = n
    end

    def valid?(pos)
        if self[pos] == nil
            return false
        end
        true
    end

    def empty?(pos)
        if self[pos] == "_"
            return true
        end
        false
    end

    def place_mark(position, mark)
        if empty?(position) && valid?(position)
            self[position]= mark
        else
            raise "Error - position not available"
        end
    end

    def [](array)
        @grid[array[0]][array[1]]
    end
  
    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end


    def print_grid
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each_with_index do |row, r_idx|
            return true if (0...@row_length).all? { |pos| row[pos] == mark}
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each_with_index do |col, idx|
            return true if (0...@column_length).all? { |kevin| col[kevin] == mark}
        end
        false
    end

    def win_diagonal?(mark)
        return true if (0...@column_length).all? { |idx| @grid[idx][idx] == mark}
        mirror = @grid.map {|row| row.reverse}
        return true if (0...@column_length).all? { |idx| mirror[idx][idx] == mark}
        false
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
            @grid.flatten.any? { |ele| ele == '_' }
    end



    # load 'board.rb'
    # test = Board.new(3)

    #test.place_mark([1, 0], :X) && test.place_mark([1, 1], :X) && test.place_mark([1, 2], :X)
    #test.place_mark([1, 1], :X)
    #test.place_mark([1, 2], :X)
    #test.place_mark([1, 5], :X)
    
    #test.place_mark([0, 0], :X) && test.place_mark([1, 0], :X) && test.place_mark([2, 0], :X)
    #test.place_mark([1, 0], :X)
    #test.place_mark([2, 0], :X)
    
# ALL of the items
    #test.place_mark([0, 0], :X) && test.place_mark([1, 1], :X) && test.place_mark([2, 2], :X) && test.place_mark([0, 1], :X) && test.place_mark([1, 0], :X) && test.place_mark([2, 1], :X) && test.place_mark([0, 2], :X) && test.place_mark([1, 2], :X) && test.place_mark([2, 0], :X)
    

    
end

