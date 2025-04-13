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

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]

	input_user = {:username => "Введите имя", :phone => "Введите телефон", :datetime => "Введите дату и время"}

	input_user.each do |key, value|

		if params[key] == ""
			@error = input_user[key]
			return erb :visit
		end

	end


	f = File.open "public/user.txt", "a"
	f.write "#{@username}, телефон: #{@phone}, дата и время: #{@datetime}\n"
	f.close

	erb :visit

end

