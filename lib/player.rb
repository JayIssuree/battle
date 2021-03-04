require_relative './attacks/heavy_attack'
require_relative './attacks/medium_attack'
require_relative './attacks/light_attack'
require_relative './attacks/paralyze'

class Player

    DEFAULT_HP = 100
    DEFAULT_MOVE_LIST = [HeavyAttack, MediumAttack, LightAttack, Paralyze]

    attr_reader :name, :hp, :move_list, :status_effects

    def initialize(name:, hp: DEFAULT_HP, move_list: DEFAULT_MOVE_LIST)
        @name = name
        @hp = hp
        @move_list = move_list
        @status_effects = []
    end

    def paralyzed?
        !status_effects.select { |status|
            status.class.name == "Paralyze"
        }.empty?
    end

    def add_status_effect(effect)
        status_effects << effect
    end

    def clear_expired_status_effects
        status_effects.reverse.each{ |effect| 
            status_effects.delete(effect) if effect.over?
        }
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