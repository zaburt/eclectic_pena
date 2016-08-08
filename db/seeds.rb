# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USERS = JSON.parse(IO.read(Rails.root.join('db', 'seeds', 'users.json')))

USERS.each do |email, name, display_name, default_pass|
  User.create(
    :email => email,
    :name => name,
    # :display_name => display_name,
    :password => default_pass,
    :password_confirmation => default_pass
  )
end


