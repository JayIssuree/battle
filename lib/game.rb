require_relative 'player'
require_relative 'computer'

class Game

    def self.create(player1:, player2:)
        @current_game = Game.new(player1: player1, player2: player2)
    end

    def self.current_game
        @current_game
    end

    attr_reader :player1, :player2, :attacking_player, :players

    def initialize(player1:, player2:)
        @player1 = player1
        @player2 = player2
        @players = [player1, player2]
        @attacking_player = players.first
    end

    def attack_defender(move_name)
        attacking_player.select_move(move_name).attack(defending_player)
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

end