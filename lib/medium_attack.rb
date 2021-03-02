class MediumAttack

    HIT_CHANCE = 80
    DAMAGE_RANGE = 20..35

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