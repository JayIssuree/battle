require_relative 'attack'

class Paralyze < Attack

    HIT_CHANCE = 80

    def self.attack(player)
        player.become_paralyzed if hit?
    end

end