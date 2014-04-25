require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")


class Dog 
	include DataMapper::Resource 
	property :id, Serial
	property :name, String
	property :age, Float
	property :gender, String
	property :breed, String 
	property :description, Text
end 

DataMapper.finalize

get '/dogs' do 
	@dogs = Dog.all
	slim :dogs
end

get '/dogs/new' do 
	@dog = Dog.new
	slim :new_dog
end 

post '/dogs' do 
	dog = Dog.create(params[:dog])
	redirect to("/dogs/#{dog.id}")
end 

get '/dogs/:id' do 
	@dog = Dog.get(params[:id])
	slim :show_dog
end 

get '/dogs/:id/edit' do
	@dog = Dog.get(params[:id])
	slim :edit_dog
end 

put '/dogs/:id' do 
	@dog = Dog.get(params[:id])
	@dog.update(params[:dog])
	redirect to("/dogs/#{@dog.id}")
end 

delete '/dogs/:id' do 
	Dog.get(params[:id]).destroy
	redirect to('/dogs')
end 


