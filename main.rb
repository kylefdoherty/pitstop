require 'sinatra'
# require 'sinatra/reloader' if development?
require 'slim'
require 'sass/plugin/rack'
use Sass::Plugin::Rack

require './dog'

configure do 
	enable :sessions
	set :username, 'molly'
	set :password, 'kyle'

end 



get('/styles.css'){scss :styles}

get '/' do
  slim :home
end

get '/about' do
  @title = "All about this website"
  slim :about
end

get '/contact' do
  @title = "Contact us"
  slim :contact
end

not_found do
  slim :not_found
end

get '/set/:name' do 
	session[:name] = params[:name]
end 

get '/login' do
	slim :login
end 

post '/login' do 
	if params[:username] == settings.username && params[:password] == settings.password
		session[:admin] = true
		redirect to('/dogs')
	else
		slim :login
	end 
end 

get '/logout' do 
	session.clear
	redirect to('/login')
end 
