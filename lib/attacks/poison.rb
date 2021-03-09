require_relative 'attack'

class Poison < Attack

    HIT_CHANCE = 70
    MOVE_PERSISTENCE = 5
    DEFUALT_DAMAGE = 4

    def self.attack(player)
        player.add_status_effect(self.new) if hit?
    end

    def self.description
        "Has a #{HIT_CHANCE}% chance to inflict a Poison that does #{DEFUALT_DAMAGE} damage to the opponent at the start of their turn for #{MOVE_PERSISTENCE} turns. Does stack."
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