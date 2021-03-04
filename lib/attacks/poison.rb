require_relative 'attack'

class Poison < Attack

    HIT_CHANCE = 70
    MOVE_PERSISTENCE = 5
    DEFUALT_DAMAGE = 4

    def self.attack(player)
        player.add_status_effect(self.new) if hit?
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