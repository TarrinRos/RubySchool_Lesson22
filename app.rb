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

get '/login/form' do
  erb :login_form
end

get '/logout' do
  erb :logout
end

post '/visit' do
  @first_name = params[:first_name]
  @surname = params[:surname]
  @phone = params[:phone]
  @date_time = params[:date_time]
  @barber_master = params[:barber_master]
  @colorpicker = params[:colorpicker]
  @after_visit = "Спасибо #{@username}, что Вы к нам записались"

  f = File.open './public/users.txt', 'a'
  f.write "Имя: #{@first_name}, Фамилия: #{@surname}, Номер телефона #{@phone}, Время посещения: #{@date_time}, Мастер: #{@barber_master}, Цвет: #{@colorpicker}" "\n"
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

post '/admin_panel' do
  @username = params[:username]
  @password = params[:password]

  if @username == 'admin' && @password == 'narn'
    erb :admin_panel
  else
    @error = 'Вы ввели не правильное имя или пароль'
    erb :login_form
  end
end

get '/admin_panel' do
  line = File.open './public/users.txt','r'
  while a = line
    @userstxt = a
    erb :admin_panel
  end
  line.close
end
