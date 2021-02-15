require 'sinatra'

get '/' do
    "Hello world"
end

get '/secret' do
    "This is a secret message"
end