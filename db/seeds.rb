# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	require 'base64'
	pass = Base64.encode64('123').strip
	User.create(username: 'admin',password: pass,email: 'admin@gmail.com',address: 'Bangalore',role: 'admin',user_type: 'admin',location: 'india',mobile: '8901234100')