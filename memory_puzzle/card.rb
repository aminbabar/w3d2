class Card
    attr_reader :face_value, :face_down

    def initialize(face_value)
        @face_value = face_value
        @face_down = true
    end

    def display
        if !@face_down
            return @face_value
        end
    end

    def hide
        @face_down = true
    end

    def reveal
        @face_down = false
    end

    def to_s
        @face_value.to_s
    end

    def ==(card_instance)
        @face_value == card_instance.face_value
    end
end

p card = Card.new(:A)
p card.display
p card.reveal 
p card.display
p card2 = Card.new(:B)
p card2 == card
p card2.to_s