class Computer < Player

    def initialize(name: "Computer", hp: DEFAULT_HP, move_list: DEFAULT_MOVE_LIST)
        @name = name
        @hp = hp
        @move_list = move_list
    end

    def random_move
        move_list.sample
    end

end