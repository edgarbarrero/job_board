# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
paco    = User.create!(name: 'Paco', kind: 'candidate')
javier  = User.create!(name: 'Javier', kind: 'candidate')
roberto = User.create!(name: 'Roberto', kind: 'candidate')

acme    = User.create!(name: 'Acme', kind: 'company')
my_taxi = User.create!(name: 'MyTaxi', kind: 'company')

ror     = Job.create(title: 'Ruby on Rails developer',
                     description: 'We are hiring a new Ruby on Rails developer',
                     company: acme)
taxi    = Job.create(title: 'Taxi driver for Madrid',
                     description: 'We are hiring a new Taxi driver for Madrid',
                     company: my_taxi)

Candidature.create(state: 'rejected',
                   user: paco,
                   job: ror)
Candidature.create(state: 'highlighted',
                  user: javier,
                  job: ror)
Candidature.create(state: 'hire',
                  user: roberto,
                  job: ror)
