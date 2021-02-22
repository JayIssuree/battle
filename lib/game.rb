require_relative 'player'

class Game

    attr_reader :player1, :player2, :attacking_player, :players

    def initialize(player1:, player2:)
        @player1 = player1
        @player2 = player2
        @players = [player1, player2]
        @attacking_player = players.first
    end

    def attack_defender
        defending_player.reduce_hp
        switch_turns
    end

    def defending_player
        defender
    end

    private

    def defender
        players.reject{|player|
            player == attacking_player
        }.first
    end

    def switch_turns
        @attacking_player = defending_player
    end

end