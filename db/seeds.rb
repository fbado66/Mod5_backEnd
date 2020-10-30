require 'net/http'
require 'openssl'
require 'json'
require 'uri'




User.destroy_all 
Cart.destroy_all 
Restaurant.destroy_all
Product.destroy_all
Order.destroy_all




####Get the api Zomato is allow only 20 data seeds at a time, so have to run the function 5 times############################
url_0 = URI("https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city&start=0&count=20")
url_1 = URI("https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city&start=20&count=20")
url_2 = URI("https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city&start=40&count=20")
url_3 = URI("https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city&start=60&count=20")
url_4 = URI("https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city&start=80&count=20")
def getApi(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(url)
  request["user-key"] = 'ba53b04d5d2860debca775f54d0d33f6'
  response = http.request(request)
  if response.code == "200"
      result = JSON.parse(response.body)
  end
  return restaurants = result["restaurants"]
end

def getApi(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["user-key"] = 'ba53b04d5d2860debca775f54d0d33f6'
    response = http.request(request)
    if response.code == "200"
        result = JSON.parse(response.body)
    end
  return restaurants = result["restaurants"]
end
api_0 = getApi(url_0)
# # pp api_0
api_1 = getApi(url_1)
api_2 = getApi(url_2)
api_3 = getApi(url_3)
api_4 = getApi(url_4)
######################### handling the data to each array ################################
def restaurants_array(restaurants)
  restaurants.map{|restaurant|
    Restaurant.create(
      name: restaurant["restaurant"]["name"],
      image_url: restaurant["restaurant"]["featured_image"],
      address: restaurant["restaurant"]["location"]["address"],
      city: restaurant["restaurant"]["location"]["city"],
      zipcode: (restaurant["restaurant"]["location"]["zipcode"]).to_i,
      code: (restaurant["restaurant"]["id"]).to_i,
      latitude: restaurant["restaurant"]["location"]["latitude"],
      longitude: restaurant["restaurant"]["location"]["longitude"]
    )}
end
restaurants_array(api_0)
restaurants_array(api_1)
restaurants_array(api_2)
restaurants_array(api_3)
restaurants_array(api_4)
##############################################################################################


user_1 = User.create!(name: 'Franklin', email:'abc123@gmail.com', address: '123 Main Street', phone_number: 3477812, password: 'abc123')
cart_1 = Cart.create!(user_id: 1, order_method: 'delivery')
# option_1 = Option.create!(name: 'drinks')


# restaurant_1 = Restaurant.create!(name: 'Bks', location: "Queens", image_url: "https://cdn.phonebooky.com/blog/wp-content/uploads/2020/05/13164828/Burgers-from-Burger-King.jpg")
# product_1 = Product.create!(name: 'soda', price: 2, image_url: 'https://www.kroger.com/product/images/xlarge/front/0004900005539', restaurant_id: 1, option_id: 1 )
# order_1 = Order.create!(cart_id: 1, product_id: 1, quantity: 2)




steak_names = ['Steak & Eggs',
"Crock-Pot Cube Steak" ,
"Creamy Steak Fettuccine",
"Best-Ever Swiss Steak",
"Reverse Sear Steak"
]

steak_images = ['https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20191219-seo-steak-eggs-delish-ehg-8986-jpg-1579900349.jpg?crop=1xw:1xh;center,top&resize=980:*',
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200108-seo-crock-pot-cube-steak-delish-ehg-9229-jpg-1579900613.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190409-creamy-steak-fettucine-vertical-2-1555596324.png?crop=1xw:1xh;center,top&resize=980:*", 
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191220-swiss-steak-243-portrait-pf-1578341719.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200108-seo-reverse-sear-steak-delish-ehg-9167-jpg-1579900220.jpg?crop=1xw:1xh;center,top&resize=980:*"

]


Product.create!(
    name: steak_names[0], 
    price: Faker::Number.decimal(l_digits: 2),
    image_url: steak_images[0],
    restaurant_id: 1,
    category: 'Steak'

)

Product.create!(
    name: steak_names[1], 
    price: Faker::Number.decimal(l_digits: 2),
    image_url: steak_images[1],
    restaurant_id: 1,
    category: 'Steak'
)

Product.create!(
    name: steak_names[2], 
    price: Faker::Number.decimal(l_digits: 2),
    image_url: steak_images[2],
    restaurant_id: 1,
    category: 'Steak'
)

Product.create!(
    name: steak_names[3], 
    price: Faker::Number.decimal(l_digits: 2),
    image_url: steak_images[3],
    restaurant_id: 1,
    category: 'Steak'
)