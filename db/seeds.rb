# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {name: 'Clark', email: 'Clark@bing', password: 'Bing111'},
  {name: 'Nark', email: 'Nark@bing', password: 'Bing111'},
  {name: 'Blark', email: 'Blark@bing', password: 'Bing111'},
  {name: 'Quark', email: 'Quark@bing', password: 'Bing111'},
  {name: 'Tark', email: 'Tark@bing', password: 'Bing111'}
  ])
