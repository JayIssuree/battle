class Attack

    HIT_CHANCE = 0
    DAMAGE_RANGE = 0

    def self.attack(player)
        player.reduce_hp(calculate_damage) if hit?
    end

    private

    def self.hit?
        rand(0..100) < HIT_CHANCE
    end

    def self.calculate_damage
        rand(DAMAGE_RANGE)
    end

end