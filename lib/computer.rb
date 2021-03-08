class Computer < Player

    def initialize(name: "Computer", hp: DEFAULT_HP, attack_list: DEFAULT_ATTACK_LIST)
        @name = name
        @hp = hp
        @attack_list = attack_list
        @status_effects = []
    end

    def random_move
        attack_list.sample
    end

end