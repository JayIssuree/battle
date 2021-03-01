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

    post '/attack' do
        Game.current_game.attack_defender
        redirect '/finished' if Game.current_game.finished?
        redirect '/play'
    end

    get '/finished' do
        @game = Game.current_game
        erb(:finished)
    end

    run! if app_file == $0
end