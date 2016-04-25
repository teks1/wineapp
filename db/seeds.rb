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

Wine.create name:"Wine 1", style:"Red wine", country:"France", year:2006
Wine.create name:"Wine 2", style:"White wine", country:"France", year:2008
Wine.create name:"Wine 3", style:"Red wine", country:"Italy", year:2010
Wine.create name:"Wine 4", style:"Red wine", country:"Chile", year:2014
