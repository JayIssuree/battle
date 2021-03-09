class Attack

    HIT_CHANCE = 0
    DAMAGE_RANGE = 0

    def self.attack(player)
        player.reduce_hp(calculate_damage) if hit?
    end

    def self.description
        "Has a #{self::HIT_CHANCE}% chance to do #{self::DAMAGE_RANGE} damage"
    end

    private

    def self.hit?
        rand(0..100) < self::HIT_CHANCE
    end

    def self.calculate_damage
        rand(self::DAMAGE_RANGE)
    end

end