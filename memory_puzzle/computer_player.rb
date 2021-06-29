require "byebug"

class ComputerPlayer
    def initialize(size)
        @hash = Hash.new { |h, k| h[k] = [] }
        @first_guess = true
        @value = nil
        @position = []
        (0...size).each do |row|
            (0...size).each do |col|
                @position << [row, col]
            end
        end
        @position.shuffle!
        @found = []
    end

    def get_input
        debugger
        if @first_guess
            @first_guess = false
            if @found.length > 0
                return @hash[@found.shift].pop
            else
                return @position.pop
            end
        else
            @first_guess = true
            if @found.length > 0
                return @hash[@found.shift].shift
            end
            return @position.pop
        end
    end

    def set_value(value, position)
        @hash[value] << position
        if @hash[value].length > 1
            @found << value
        end
    end
end