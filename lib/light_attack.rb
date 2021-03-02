class LightAttack

    HIT_CHANCE = 99
    DAMAGE_RANGE = 10..20

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