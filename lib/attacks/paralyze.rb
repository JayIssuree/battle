require_relative 'attack'

class Paralyze < Attack

    HIT_CHANCE = 80
    MOVE_PERSISTENCE = 2
    DEFUALT_DAMAGE = 0

    def self.attack(player)
        player.add_status_effect(self.new) if hit?
    end

    def self.description
        "Has a #{HIT_CHANCE}% chance to do Paralyze the opponent for #{MOVE_PERSISTENCE} moves"
    end

    attr_reader :move_count, :damage

    def initialize
        @move_count = 0
        @damage = DEFUALT_DAMAGE
    end

    def incriment_move_count
        @move_count += 1
    end

    def over?
        move_count > MOVE_PERSISTENCE
    end

end