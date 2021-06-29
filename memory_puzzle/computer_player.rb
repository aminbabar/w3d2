class ComputerPlayer
    def initialize(size)
        @first_guess = true
        @value = nil
        @position = []
        (0...size).each do |row|
            (0...size).each do |col|
                @position << [row, col]
            end
        end
    end

    def get_input
        if @first_guess 
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