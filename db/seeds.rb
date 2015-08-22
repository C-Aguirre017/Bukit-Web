# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Carlos = User.create!(email: 'ejcorrea@uc.cl', name: 'Enrique Correa', password: 'mamamia123', password_confirmation: 'mamamia123', role: 'usuario', authentication_token: 'LDskzPi1vfr31746VKG3', provider: 'facebook', uid: '10152571663971400')

#Carlos = User.create!(email: 'c.aguirre017@gmail.com', name: 'Carlos Aguirre', password: 'mamamia123', password_confirmation: 'mamamia123', role: 'usuario', authentication_token: 'LDskzPi1vfr31746VKG3', provider: 'facebook', uid: '10206157769204221')

# Creamos algunos pines y ramos
#r = Course.create!(name: "LA ESCENA INTERNA".titleize(), initials: "ACO213E")

# Creamos algunos pines
#Pin = Pin.create!(user: Carlos, title: r.initials + " " + r.name  , publication: Time.now, realization: nil, duration: 30, price: 5000, faculty: 'san joaquin', latitude: -33.498444, longitude: -70.611722, course: r)

# Loads from "seeds" folder sorting by number prefix
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }