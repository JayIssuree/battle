class Player

    attr_reader :name, :hp

    def initialize(name:)
        @name = name
        @hp = 100
    end

    def attack(player)
        player.reduce_hp
    end

    def reduce_hp
        @hp -= 20
    end

end