# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rm existing data
User.destroy_all
Event.destroy_all

# Create dummy users
User.create( username: 'Jane', password: 'janepass')
User.create( username: 'Jon', password: 'jonpass')

## Create dummy events for users
Event.create( event: '400m', event_type: 'track', user_id: 7)
Event.create( event: 'Tripple Jump', event_type: 'field', user_id: 7)
Event.create( event: '800m', event_type: 'track', user_id: 8)
Event.create( event: '1600m', event_type: 'track', user_id: 8)
