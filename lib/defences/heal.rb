class Heal

    HIT_CHANCE = 80
    HEAL_RANGE = 0..20

    def self.on(player)
        player.increase_hp(calculate_heal) if hit?
    end

    private

    def self.hit?
        rand(0..100) < self::HIT_CHANCE
    end

    def self.calculate_heal
        rand(self::HEAL_RANGE)
    end

end