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

post '/named-cat' do
    @name = params[:name]
    erb(:cat)
end

get '/cat-name-form' do
    erb(:cat_name_form)
end