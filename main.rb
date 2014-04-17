require 'sinatra' 
require 'slim' 

get '/' do 
	slim :home
end 

get '/about' do 
	@title = "All About This Website"
	slim :about 
end 

get '/contact' do
	@title = "Contact Us" 
	slim :contact
end 

not_found do 
	slim :not_found
end 





