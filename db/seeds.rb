# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all 
Cart.destroy_all 
Option.destroy_all 
Restaurant.destroy_all
Product.destroy_all
Order.destroy_all

user_1 = User.create!(name: 'Franklin', email:'abc123@gmail.com', address: '123 Main Street', phone_number: 3477812, password: 'abc123')
cart_1 = Cart.create!(user_id: 1, method: 'delivery')
option_1 = Option.create!(name: 'drinks')
restaurant_1 = Restaurant.create!(name: 'Bks', location: "Queens", image_url: "https://cdn.phonebooky.com/blog/wp-content/uploads/2020/05/13164828/Burgers-from-Burger-King.jpg")
product_1 = Product.create!(name: 'soda', price: 2, image_url: 'https://www.kroger.com/product/images/xlarge/front/0004900005539', restaurant_id: 1, option_id: 1 )
order_1 = Order.create!(cart_id: 1, product_id: 1, quantity: 2)