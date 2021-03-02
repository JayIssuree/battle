require_relative 'player'
require_relative 'computer'
require_relative 'heavy_attack'

class Game

    def self.create(player1:, player2:)
        @current_game = Game.new(player1: player1, player2: player2)
    end

    def self.current_game
        @current_game
    end

    DEFAULT_ATTACK_LIST = [HeavyAttack]

    attr_reader :player1, :player2, :attacking_player, :players, :attack_list

    def initialize(player1:, player2:, attack_list: DEFAULT_ATTACK_LIST)
        @player1 = player1
        @player2 = player2
        @players = [player1, player2]
        @attacking_player = players.first
        @attack_list = attack_list
    end

    # def attack_defender
    #     defending_player.reduce_hp
    #     switch_turns
    # end

    def attack_defender(move_name)
        find_move(move_name).attack(defending_player)
    end

    def defending_player
        defender
    end

    def finished?
        attacking_player.hp <= 0 || defending_player.hp <= 0
    end

    def loser
        players.select{|player|
            player.hp <= 0
        }.first
    end

    def switch_turns
        @attacking_player = defending_player
    end

    private

    def defender
        players.reject{|player|
            player == attacking_player
        }.first
    end

    def find_move(move_name)
        attack_list.select{ |attack| 
            attack.name == move_name
        }.first
    end

end