class Board

    def initialize(size)
        @grid = Array.new(size) { Array.new(size) }
    end

    def populate(card_instance)
        i = 0
        while i < 2 
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] == nil
                @grid[row][col] = card_instance
                i += 1
            end
        end
    end

    def render
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def won?()
        @grid.all? do |row|
            row.all? {|ele| ele.face_down == false}
        end
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        if @grid[row][col].face_down == true
            @grid[row][col].reveal
            @grid[row][col].face_value
        end
    end


end