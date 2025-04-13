require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username].capitalize
	@phone = params[:phone]
	@datetime = params[:datetime]
	@master = params[:master]

	input_user = {:username => "Введите имя", :phone => "Введите телефон", :datetime => "Введите дату и время", :master => "Выбирите мастера"}

	input_user.each do |key, value|

		if params[key].to_s.strip.empty?
			@error = input_user[key]
			return erb :visit
		end

	end


	f = File.open "public/user.txt", "a"
	f.write "#{@username}, телефон: #{@phone}, дата и время: #{@datetime}, мастер #{@master}\n"
	f.close

	@message = "#{@username}, вы успешно записаны на #{@datetime} к мастеру #{@master}!"

	erb :visit

end

get '/contacts' do

	erb :contacts

end

post '/contacts' do

	@username = params[:username]
	@user_email = params[:user_email]
	@user_message = params[:user_message]

	input_user = {:username => "Введите имя", :user_email => "Введите ваш e-mail", :user_message => "Введите ваше сообщение"}

	input_user.each do |key, value|

		if params[key].to_s.strip.empty?
			@error = input_user[key]
			return erb :contacts
		end
	end

	@message = "Ваше сообщение успешно отправлено!"

	erb :contacts

end


