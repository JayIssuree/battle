require 'sinatra'

get '/' do
    "Hello world"
end

get '/secret' do
    "This is a secret message"
end

get '/cat' do
    "<html>
        <img src='https://static.toiimg.com/photo/msid-67586673/67586673.jpg?3918697' width=850 height=600 style='border: 3px dashed red'>
    <html>"
end