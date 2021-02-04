class Board

    def initialize(n)
        @grid = Array.new(3) {Array.new(3, '_')}
        @size = n * n
        @row_length = n
        @column_length = n
    end

    def size
        @size
    end

    def [](array)
        @grid[array[0]][array[1]]
    end
  
    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count { |el| el == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos]= :H 
            p "you sunk my battleship!"
            true
        else
            self[pos]= :X
            false
        end
    end

    def place_random_ships
        count = @size * 0.25  
        while count > 0
            x = rand(0...@column_length)
            y = rand(0...@row_length)
            if @grid[x][y] != :S 
                @grid[x][y] = :S 
                count -= 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = @grid.map do |subarr|
                        subarr.map do |ele|
                            if ele == :S
                                ele = :N
                            else
                                ele = ele
                            end
                        end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


    
end

