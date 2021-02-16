require 'sinatra'

get '/' do
    erb(:index)
end

get '/secret' do
    erb(:secret)
end

get '/random-cat' do
    @name = ["Amigo", "Misty", "Almond"].sample
    erb(:cat)
end

get '/named-cat' do
    @name = params[:name]
    erb(:cat)
end