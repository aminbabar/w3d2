class Board

    def initialize(size)
        raise "size is not even" if size % 2 != 0
        @grid = Array.new(size) { Array.new(size) }
    end

    def populate
        alpha = ("a".."z").to_a
        letters = []
        ((@grid.length * @grid.length) / 2).times do
            letter = alpha.sample
            letters << letter
            letters << letter
        end
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                letter = letters.sample
                letters.delete(letter)
                @grid[row][col] = letter
            end
        end
    end

    def render
        @grid.each do |row|
            puts row.map { |ele| ele.display }
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