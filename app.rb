require 'sinatra'
require './lib/game'

class Battle < Sinatra::Base

    get '/' do
        erb(:index)
    end

    post '/names' do
        player1 = params[:player_1].empty? ? Computer.new : Player.new(name: params[:player_1])
        player2 = params[:player_2].empty? ? Computer.new : Player.new(name: params[:player_2])
        Game.create(player1: player1, player2: player2)
        redirect '/play'
    end

    get '/play' do
        @game = Game.current_game
        erb(:play)
    end

    get '/attack' do
        @game = Game.current_game
        erb(:attack)
    end

    post '/switch_turns' do
        Game.current_game.switch_turns
        redirect '/finished' if Game.current_game.finished?
        redirect '/play'
    end

    post '/attack' do
        Game.current_game.attack_defender(params[:move_name])
        redirect "/attack/#{params[:move_name]}"
    end

    get '/attack/:move_name' do
        @game = Game.current_game
        @move = params[:move_name]
        erb(:attack)
    end

    post '/computer_move' do
        @random_move = Game.current_game.attacking_player.random_move
        if @random_move < Attack
            Game.current_game.attack_defender(@random_move.name)
            redirect "/attack/#{@random_move}"
        else
            Game.current_game.defend_current_player(@random_move.name)
            redirect "/defend/#{@random_move}"
        end
    end

    post '/defend' do
        Game.current_game.defend_current_player(params[:move_name])
        redirect "/defend/#{params[:move_name]}"
    end

    get '/defend/:move_name' do
        @game = Game.current_game
        @move = params[:move_name]
        erb(:defend)
    end

    get '/finished' do
        @game = Game.current_game
        erb(:finished)
    end

    run! if app_file == $0
end