class Player

    DEFAULT_HP = 100

    attr_reader :name, :hp

    def initialize(name:, hp: DEFAULT_HP)
        @name = name
        @hp = hp
    end

    def reduce_hp
        @hp -= 20
    end

end