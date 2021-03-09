class Computer < Player

    def initialize(name: "Computer", hp: DEFAULT_HP, attack_list: DEFAULT_ATTACK_LIST, defence_list: DEFAULT_DEFENCE_LIST)
        @name = name
        @hp = hp
        @attack_list = attack_list
        @defence_list = defence_list
        @all_moves = attack_list + defence_list
        @status_effects = []
    end

    def random_move
        all_moves.sample
    end

end