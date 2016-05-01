# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Style.create name:"Red wine"
Style.create name:"White wine"
Style.create name:"Rose wine"
Style.create name:"Sparkling wine"
Style.create name:"Champagne"
Style.create name:"Dessert wine"

User.create username:"admin", password:"$2a$10$J9rvLqCzodruYW0NPyr.XORcGt4.XLcSASeE8K3v/HXjpD.WMDzJe", password_salt:"$2a$10$J9rvLqCzodruYW0NPyr.XO", admin:true
