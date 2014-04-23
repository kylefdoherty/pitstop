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