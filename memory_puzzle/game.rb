require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    attr_reader(:size)

    def initialize(size, player)
        @player = player
        @board = Board.new(size)
        @board.populate
        @previously_guessed_pos = []
        @size = size
    end


    def play
        while !@board.won?
            system("clear") 
            @board.render

            @previously_guessed_pos << @player.get_input

            val_1 = @board.reveal(@previously_guessed_pos[-1])
            @player.set_value(val_1, @previously_guessed_pos[-1])

            system("clear")
            @board.render
            sleep(1)
            system("clear")
            # cheat
            # @board.cheat
            # sleep(5)
            # system("clear")
            # ---
            @previously_guessed_pos << @player.get_input
            val_2 = @board.reveal(@previously_guessed_pos[-1])
            @player.set_value(val_2, @previously_guessed_pos[-1])

            @board.render
            sleep(1)
            if val_1 != val_2
                @board.hide(@previously_guessed_pos[-1])
                @board.hide(@previously_guessed_pos[-2])
            end
        end
        p "you win!!"
    end
end



# human_player = HumanPlayer.new()
computer_player = ComputerPlayer.new(4)


game = Game.new(4, computer_player)
game.play