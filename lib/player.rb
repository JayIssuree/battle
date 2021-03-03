require_relative './attacks/heavy_attack'
require_relative './attacks/medium_attack'
require_relative './attacks/light_attack'

class Player

    DEFAULT_HP = 100
    DEFAULT_MOVE_LIST = [HeavyAttack, MediumAttack, LightAttack]

    attr_reader :name, :hp, :move_list

    def initialize(name:, hp: DEFAULT_HP, move_list: DEFAULT_MOVE_LIST)
        @name = name
        @hp = hp
        @move_list = move_list
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