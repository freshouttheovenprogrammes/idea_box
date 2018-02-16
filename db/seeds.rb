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

Image.create!(title:"Dawg", image: 'https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Natural-Dog-Law-2-To-dogs%2C-energy-is-everything.jpg?itok=Z-ujUOUr' )
Image.create!(title:"Rambo", image: 'http://www.dogbreedslist.info/uploads/allimg/dog-pictures/German-Shepherd-Dog-1.jpg' )
Image.create!(title:"Peaceful", image: 'http://r.ddmcdn.com/w_830/s_f/o_1/cx_20/cy_1463/cw_2528/ch_1422/APL/uploads/2014/11/puppy-cam-veer-2893191.jpg' )
Image.create!(title:"Meow", image: 'http://www.dogbreedslist.info/uploads/allimg/dog-pictures/Siberian-Husky-1.jpg' )
Image.create!(title:"One Cool Dude", image: 'https://www.petinsurance.com/images/VSSimages/consumer/v5/banner_dog_insurance.jpg' )
Image.create!(title:"Bork", image: 'https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Common-dog-behaviors-explained.jpg?itok=FSzwbBoi' )

5.times do |n|
  Category.create!(name: "Category #{n}")
end
