require_relative 'attack'

class Paralyze < Attack

    HIT_CHANCE = 80
    MOVE_PERSISTENCE = 2

    def self.attack(player)
        player.add_status_effect(self.new) if hit?
    end

    attr_reader :move_count

    def initialize
        @move_count = 0
    end

    def incriment_move_count
        @move_count += 1
    end

    def over?
        move_count > MOVE_PERSISTENCE
    end

end