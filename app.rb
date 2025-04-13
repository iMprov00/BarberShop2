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

	input_user = {:username => "введите имя", :phone => "введите телефон", :datetime => "введите дату и время"}

	@error = input_user.select{|key, value| params[key].to_s.strip.empty?}.values.join(", ")

	if @error.to_s.strip.empty?

	else
		erb :visit
	end


	f = File.open "public/user.txt", "a"
	f.write "#{@username}, телефон: #{@phone}, дата и время: #{@datetime}\n"
	f.close


end

