# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Image.destroy_all
Category.destroy_all

User.create!(email: "boss@gmail.com", password: "bossperson", full_name: "CEO", role: 1)

Image.create!(title:"Dawg", image: 'app/assets/images/IMG_2433.jpg' )
Image.create!(title:"Rambo", image: 'app/assets/images/IMG_2445.jpg' )
Image.create!(title:"Peaceful", image: 'app/assets/images/IMG_2711.jpg' )
Image.create!(title:"Meow", image: 'app/assets/images/IMG_2974.jpg' )
Image.create!(title:"One Cool Dude", image: 'app/assets/images/IMG_3282.jpg' )
Image.create!(title:"Bork", image: 'app/assets/images/IMG_3315.jpg' )

5.times do |n|
  Category.create!(name: "Category #{n}")
end
