require 'sinatra'

get '/' do
    erb(:index)
end

get '/secret' do
    erb(:secret)
end

get '/cat' do
    @name = ["Amigo", "Misty", "Almond"].sample
    erb(:cat)
end