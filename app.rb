# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb 'Hello! <a href="https://github.com/bootstrap-ruby/sinatra-bootstrap">Original</a> pattern has been modified for <a href="http://rubyschool.us/">Ruby School</a>!!!'
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

post '/visit' do
  @username = params[:username]
  @surname = params[:surname]
  @phone = params[:phone]
  @date_time = params[:date_time]
  f = File.open './public/users.txt', 'a'
  f.write "Имя: #{@username}, Фамилия: #{@surname}, Номер телефона #{@phone},Время посещения: #{@date_time}"
  f.close
end
