require_relative "card.rb"
require "byebug"


class Board

    def initialize(size)
        raise "size is not even" if size % 2 != 0
        @grid = Array.new(size) { Array.new(size, "_") }
    end
    
    def hide(pos)
        row, col = pos
        @grid[row][col].hide
    end

    def populate
        alpha = ("a".."z").to_a
        letters = []
        ((@grid.length * @grid.length) / 2).times do
            letter = alpha.sample
            letters << letter
            letters << letter
        end
        letters.shuffle!
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                @grid[row][col] = Card.new(letters.pop)
            end
        end
    end

    def render
        puts "___________"
        @grid.each do |row|
            row.each do |ele|
                if ele.face_down == true
                    print "_"
                else
                    print ele.display
                end
                print " "
            end
            puts ""
        end
        puts "___________"
    end

    def won?
        @grid.all? do |row|
            row.all? {|ele| ele.face_down == false}
        end
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        if @grid[row][col].face_down == true
            @grid[row][col].reveal
            return @grid[row][col].face_value
        end
    end

    def cheat
        puts "___________"
        @grid.each do |row|
            row.each do |ele|
                print ele.face_value
                print " "
            end
            puts ""
        end
        puts "___________"
    end
end