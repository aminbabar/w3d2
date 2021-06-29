class ComputerPlayer
    def initialize(size)
        @hash = {}
        @first_guess = true
        @value = nil
        @position = []
        (0...size).each do |row|
            (0...size).each do |col|
                @position << [row, col]
            end
        end
        @position.shuffle!
    end

    def get_input

        if @first_guess
            @first_guess = false
            return @position.pop
        else


        end
    end

    def set_value(value)
        @value = value
    end

    def random(size)
        row = rand(0...size)
        col = rand(0...size)
        if 

    end

end