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

get '/after_visit' do
  erb :after_visit
end

get '/after_send' do
  erb :after_send
end

post '/visit' do
  @first_name = params[:first_name]
  @surname = params[:surname]
  @phone = params[:phone]
  @date_time = params[:date_time]
  @barber_master = params[:barber_master]
  @after_visit = "Спасибо #{@username}, что Вы к нам записались"

  f = File.open './public/users.txt', 'a'
  f.write "Имя: #{@first_name}, Фамилия: #{@surname}, Номер телефона #{@phone},Время посещения: #{@date_time}, Мастер: #{@barber_master}"
  f.close
  erb :after_visit
end

post '/contacts' do
  @email = params[:email]
  @message = params[:message]
  @after_send = 'Спасибо Вам, за Ваше сообщение.'

  f = File.open './public/contacts.txt', 'a'
  f.write "Почта: #{@email}, Сообщения: #{@message}"
  f.close
  erb :after_send
end
