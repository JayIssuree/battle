require_relative './attacks/heavy_attack'
require_relative './attacks/medium_attack'
require_relative './attacks/light_attack'
require_relative './attacks/paralyze'
require_relative './attacks/poison'
require_relative './defences/heal'
require_relative './defences/greater_heal'

class Player

    DEFAULT_HP = 100
    DEFAULT_ATTACK_LIST = [HeavyAttack, MediumAttack, LightAttack, Paralyze, Poison]
    DEFAULT_DEFENCE_LIST = [Heal, GreaterHeal]

    attr_reader :name, :hp, :attack_list, :defence_list, :all_moves, :status_effects

    def initialize(name:, hp: DEFAULT_HP, attack_list: DEFAULT_ATTACK_LIST, defence_list: DEFAULT_DEFENCE_LIST)
        @name = name
        @hp = hp
        @attack_list = attack_list
        @defence_list = defence_list
        @all_moves = attack_list + defence_list
        @status_effects = []
    end

    def paralyzed?
        !status_effects.select { |status|
            status.class.name == "Paralyze"
        }.empty?
    end

    def poisoned?
        !status_effects.select { |status|
            status.class.name == "Poison"
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

    def execute_damage_from_status_effects
        status_effects.each { |status|
            reduce_hp(status.damage)
        }
    end

    def reduce_hp(amount)
        @hp -= amount
    end

    def increase_hp(amount)
        @hp += amount
    end

    def select_move(move_name)
        all_moves.select{ |move| 
            move.name == move_name
        }.first
    end

end