require_relative "./board.rb"

class Game
    def initialize(size)
        @board = Board.new(size)
        @board.populate
        @board.render
        @previously_guessed_pos = []
    end

    def play
        while !@board.won?
            system("clear")
            @board.render
            pos_1 = gets.chomp.split(" ").map(&:to_i)
            val_1 = @board.reveal(pos_1)
            system("clear")
            @board.render
            sleep(1)
            system("clear")
            #cheat
            # @board.cheat
            # sleep(5)
            # system("clear")
            #---
            pos_2 = gets.chomp.split(" ").map(&:to_i)
            val_2 = @board.reveal(pos_2)
            @board.render
            sleep(1)
            if val_1 != val_2
                @board.hide(pos_1)
                @board.hide(pos_2)
            end
        end
        p "you win!!"
    end
end



game = Game.new(2)
game.play