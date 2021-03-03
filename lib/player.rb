require_relative './attacks/heavy_attack'
require_relative './attacks/medium_attack'
require_relative './attacks/light_attack'
require_relative './attacks/paralyze'

class Player

    DEFAULT_HP = 100
    DEFAULT_MOVE_LIST = [HeavyAttack, MediumAttack, LightAttack, Paralyze]

    attr_reader :name, :hp, :move_list

    def initialize(name:, hp: DEFAULT_HP, move_list: DEFAULT_MOVE_LIST)
        @name = name
        @hp = hp
        @move_list = move_list
        @paralyzed = false
    end

    def paralyzed?
        @paralyzed
    end

    def become_paralyzed
        @paralyzed = true
    end

    def clear_status_effects
        @paralyzed = false
    end

    def reduce_hp(amount)
        @hp -= amount
    end

    def select_move(move_name)
        move_list.select{ |attack| 
            attack.name == move_name
        }.first
    end

end