require 'sinatra'
require './lib/game'

class Battle < Sinatra::Base
    set :session_secret, 'super_secret'
    enable :sessions

    get '/' do
        erb(:index)
    end

    post '/names' do
        # session[:player_1] = params[:player_1]
        # session[:player_2] = params[:player_2]
        $game = Game.new(player1: Player.new(name: params[:player_1]), player2: Player.new(name: params[:player_2]))
        redirect '/play'
    end

    get '/play' do
        @player_1 = $game.player1
        @player_2 = $game.player2
        erb(:play)
    end

    get '/attack' do
        @player_1 = $game.player1
        @player_2 = $game.player2
        erb(:attack)
    end

    post '/attack' do
        $game.attack($game.player2)
        redirect '/play'
    end

    run! if app_file == $0
end