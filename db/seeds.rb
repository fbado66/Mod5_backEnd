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


# user_1 = User.create!(name: 'Franklin', email:'abc123@gmail.com', address: '123 Main Street', phone_number: 3477812, password: 'abc123')
# cart_1 = Cart.create!(user_id: 1, order_method: 'delivery')



steak_names = ['Steak & Eggs',
"Crock-Pot Cube Steak" ,
"Creamy Steak Fettuccine",
"Best-Ever Swiss Steak",
"Reverse Sear Steak",
"Air Fryer Steak",
"Round Steak",
"Cube Steak",
"Herb Butter London Broil",
"Caprese Steak",
"Flank Steak with Chimichurri",
"Best-Ever Flank Steak",
"Cheesesteak Stuffed Peppers",
"Cajun Butter Steak",
"Best-Ever Filet Mignon",
"Beef & Broccoli Noodles",
"Beef Tenderloin",
"Chicken Fried Steak Fingers",
"Lemon Butter Steak",
"Philly Cheesesteak Casserole",
"Salisbury Steak",
"French Dip Roll-Ups",
"Ramen Noodle Skillet with Steak",
"Balsamic Grilled Steak Salad with Peaches",
"Philly Cheesesteak Omelet",
"Philly Cheesesteak",
"Steak Frites Bites",
"Sizzling Steak Fajitas",
"Mongolian Beef Ramen",
"Philly Cheesesteak Lettuce Wraps"
]

steak_images = ['https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20191219-seo-steak-eggs-delish-ehg-8986-jpg-1579900349.jpg?crop=1xw:1xh;center,top&resize=980:*',
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200108-seo-crock-pot-cube-steak-delish-ehg-9229-jpg-1579900613.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190409-creamy-steak-fettucine-vertical-2-1555596324.png?crop=1xw:1xh;center,top&resize=980:*", 
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191220-swiss-steak-243-portrait-pf-1578341719.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200108-seo-reverse-sear-steak-delish-ehg-9167-jpg-1579900220.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190807-air-fryer-steak-0068-portrait-pf-1566237752.jpg?crop=0.9997369113391213xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200109-seo-round-steak-delish-ehg-9269-jpg-1579900169.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200107-seo-cube-steak-delish-ehg-9096-jpg-1579900461.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-london-broil-vertical-1546559244.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/singleimagebug-caprese-steak-1547509527.jpg?crop=1xw:0.9453781512605042xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190606-chimichurri-052-portrait-pf-1560544415.jpg?crop=0.9997369113391213xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/18/08/1519156688-flank-steak-veritcal.jpg?crop=1.0xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-philly-cheesesteak-stuffed-peppers-horizontal-1537190073.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-cajun-butter-steak-pinterest-still001-1528496068.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/singleimagebug-filet-mignon-1541189248.jpg?crop=1xw:0.9453781512605042xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/16/05/1454367376-noodles-skinny-beef.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/17/38/1506012246-beef-tenderloin-delish.jpg?crop=1.0xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-chicken-fried-steak-fingers-2-1523035313.png?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-lemon-butter-steak-3v-1547680541.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/philly-cheesesteak-casserole-1547679296.jpg?crop=0.759xw:0.759xh;0.128xw,0.151xh&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/17/33/1600x2399/gallery-1502989237-salisbury-steak-delish-1.jpg?resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/french-dip-pinwheels-vertical-1533670021.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/16/08/1456159099-delish-ramen-skillet.jpg?crop=1xw:0.99975xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/16/21/1464042389-delish-summer-salads-balsamic-steak-peach.jpg?crop=1xw:0.99975xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/17/19/640x959/gallery-1494615014-delish-philly-cheesesteak-omelette-pin-3.jpg?resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/17/26/1498851902-shot-2-163.jpg?crop=1.0xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/18/09/1520218624-shot-6-548.jpg?crop=1.0xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-sizzling-steak-fajitas-vertical-5-1527776080.jpg?crop=1xw:1xh;center,top&resize=980:*",
"https://hips.hearstapps.com/del.h-cdn.co/assets/17/05/640x958/gallery-1485807825-delish-mongolian-beef-ramen-pin-3.jpg?resize=980:*",
"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190402-philly-cheesesteak-lettuce-wraps-vertical-288-1555013906.jpg?crop=1xw:1xh;center,top&resize=980:*"
]

salad_names = [
    "Brussel Sprouts Caesar Salad",
    "Apple Salad",
    "Beef Taco Salad",
    "Loaded Cauliflower Salad",
    "Keto Broccoli Salad",
    "Guacamole Salad",
    "Watermelon Quinoa Salad",
    "Chicken Salad Sandwich",
    "Keto Egg Salad",
    'Mexican Corn Salad',
    "Holiday Roasted Vegetables",
    "Classic Potato Salad",
    "Best Tuna Salad",
    "Greek Pasta Salad",
    "Strawberry Spinach Salad",
    "Greek Orzo Salad",
    "Watermelon Feta Salad",
    "Egg Salad",
    "Grilled Chicken Bruschetta Pasta Salad",
    "Italian Pasta Salad",
    "Spinach Salad",
    "Broccoli Bacon Salad",
    "Mediterranean Grilled Chicken Salad",
    "Southwestern Chopped Salad",
    "Seared Ahi Tuna & Arugula Pear Salad",
    "Best-Ever Tabouli Salad",
    "Noodle Salad",
    "Lentil Salad",
    "Buffalo Chickpea Salad",
    "Fruit Salad"
]


salad_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-brussels-sprouts-caeser-salad-still001-1602698961.jpg?crop=0.486xw:0.863xh;0.263xw,0.0798xh&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/50/640x640/square-1481731585-delish-holiday-apple-salad-pin-3.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/29/1600x1600/square-1469126666-beef-taco-saladl1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190410-loaded-cauliflower-salad-059-1-1555947926.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190625-keto-broccoli-salad-0166-landscape-pf-1561753084.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cheesecake-factory-guacamole-salad-1602085417.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-watermelon-quinoa-salad-still002-1600096432.jpg?crop=0.492xw:0.875xh;0.260xw,0.0855xh&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/32/1600x1600/square-1502305153-chicken-salad-sandwich-delish-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190328-keto-egg-salad-horizontal-157-1556053601.jpg?crop=0.6668421052631579xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/19/1280x1280/square-1462904293-delish-corn-salad.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190808-vegetable-medley-0043-landscape-pf-1567108247.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190411-potato-salad-horizontal-1-1555688422.png?crop=0.668xw:1.00xh;0.202xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/shot-4-0352-1522855625.png?crop=0.5625xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/27/1024x1024/square-1467815004-hearst-pastasalad-greekpastasalad5407.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-strawberry-spinach-salad-still002-1556293690.jpg?crop=0.5625xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-greek-orzo-pasta-salad-still003-1555944730.jpg?crop=0.564xw:1.00xh;0.220xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/watermelon-feta-salad-1524665172.png?crop=0.563xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/15/1024x1024/square-1492002233-delish-egg-salad-2.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/200218-tyson-delish-shot01-047-nopackaging-3x2-1582861611.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pasta-salad-horizontal-jpg-1522172096.jpg?crop=0.668xw:1.00xh;0.0978xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spinachsaladhorizontal-jpg-1592245758.jpg?crop=0.636xw:0.952xh;0.0689xw,0.0481xh&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/24/1024x1024/square-1497455943-delish-broccoli-salad-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-grilled-chicken-salad-1528303935.jpg?crop=0.7508710801393729xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/15/33/2048x2048/square-1439478953-weeknight-dinner-black-bean-salad.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190226-seared-tuna-435-1552085484.jpg?crop=0.670xw:1.00xh;0.128xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190815-tabouleh-0175-landscape-pf-1566333749.jpg?crop=0.668xw:1.00xh;0.218xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/noodle-salad-horizontal-4-jpg-1589579939.jpg?crop=0.670xw:1.00xh;0.189xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200422-lentil-salad-delish-ehg-9980-1588271086.jpg?crop=0.553xw:0.829xh;0.256xw,0.00240xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-buffalo-chickpea-salad-still001-1587482752.jpg?crop=0.385xw:0.684xh;0.317xw,0.125xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pasta-salad-horizontal-jpg-1522265695.jpg?crop=0.6668xw:1xh;center,top&resize=980:*"
]

soup_names = [
    "Cream of Potato Soup",
    "Vegetable Cabbage Soup",
    "Cauliflower Soup",
    "Chicken Tortilla Soup",
    "Chicken Noodel Soup",
    "Broccoli Cheddar Soup",
    "Tomato Basil Soup",
    "Wonton Soup",
    "Crock-Pot Chicken Enchilada Soup",
    "Butternut Squash Soup",
    "Sausage and White Bean Soup",
    "Stuffed Pepper Soup",
    "Chicken Pot Pie Soup",
    "Hot & Sour Soup",
    "Chicken Pozole",
    "Classic Corn Chowder",
    "Split Pea Soup",
    "Lobster Bisque",
    "Ham & Bean Soup",
    "Keto Broccoli Cheddar Soup",
    "Taco Soup",
    "Mediterranean Shrimp & Rice Soup",
    "Prime Rib Soup",
    "Hamburger Soup",
    "Turkey Carcass Soup",
    "Coconut Pumpikin Soup",
    "Panera Autunm Squash Soup",
    "French Onion Dip",
    "Carrot Soup",
    "Ginger Miso Carrot Soup"
]

soup_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-cream-of-potato-soup-046-ls-1603756481.jpg?crop=0.670xw:1.00xh;0.0208xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cabbage-soup-horizontal-1529355743.png?crop=0.667xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cauliflower-soup-seo-front-final-00-01-12-03-still004-1538772488.jpg?crop=0.566xw:1.00xh;0.115xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/slow-cooker-chicken-tortilla-soup-1526673339.png?crop=0.563xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/38/1506010321-chicken-noodle-soup-delish-1.jpg?crop=0.492xw:0.738xh;0.231xw,0.221xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/broccoli-cheddar-soup-horizontal-1540413281.png?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-tomato-soup-still001-1602173896.jpg?crop=0.564xw:1.00xh;0.231xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/33/1600x1600/square-1502989468-wonton-soup-delish-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/49/1024x1024/square-1512441422-delish-crock-pot-chicken-enchilada-soup-still002.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/38/1600x1600/square-1506016541-roasted-butternut-squash-soup-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191111-slow-cooker-sausage-and-white-bean-soup-0049-landscape-pf-1573681299.jpg?crop=0.668xw:1.00xh;0.0609xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stuffed-pepper-soup-horizontal-1529963312.jpg?crop=0.6668xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/07/1024x1024/square-1487364529-delish-chicken-pot-pie-soup-3.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hot-and-sour-soup-horizontal-2-jpg-1598292334.jpg?crop=0.667xw:1.00xh;0.00680xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/39/1600x1600/square-1506455863-delish-posole.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/26/1600x1600/square-1498851357-shot-4-328.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190319-split-pea-soup-138-1553791829.jpg?crop=0.670xw:0.998xh;0.0769xw,0.00240xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190625-lobster-bisque-0220-landscape-pf-1561752864.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200310-ham-and-bean-soup-horizontal-13490-eb-1584470531.jpg?crop=0.615xw:0.923xh;0.369xw,0.0769xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-202001-keto-broccoli-cheddar-soup-0044-landscape-pf-1583437789.jpg?crop=0.670xw:1.00xh;0.184xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/34/1600x1600/square-1503419036-taco-soup-delish.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mediterranean-shrimp-rice-soup-1-1581706228.jpg?crop=0.670xw:1.00xh;0.165xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191217-prime-rib-soup-342-landscape-pf-1-1577746047.jpg?crop=0.668xw:1.00xh;0.0465xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191111-hamburger-soup-0031-landscape-pf-1573681125.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191016-turkey-carcass-soup-0124-landscape-pf-1572371583.jpg?crop=0.670xw:1.00xh;0.175xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-coconut-pumpkin-soup-still001-1570811910.jpg?crop=0.564xw:1.00xh;0.220xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190827-panera-autumnal-squash-soup-0330-landscape-pf-1568917553.jpg?crop=0.668xw:1.00xh;0.313xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-french-onion-dip-still002-1568989184.jpg?crop=0.566xw:1.00xh;0.314xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20190701-delish-carrot-and-coriander-soup-ehg-323-horizontal-1562864718.png?crop=0.668xw:1.00xh;0.178xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190606-carrot-soup-121-landscape-pf-1560544439.jpg?crop=0.636xw:0.957xh;0.260xw,0.00481xh&resize=980:*"
]

chicken_names = [
    "Brick Chicken",
    "Korean Fried Chicken",
    "Butter Pecan Chicken Bites",
    "Chicken Teriyaki Pineapple Bowls",
    "Crockpot Chiken Fajitas",
]

chicken_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/brick-chick-40-1602008992.jpg?crop=0.5625xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190130-korean-fried-chicken-horizontal-041-1549304734.jpg?crop=0.502xw:1.00xh;0.139xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/butter-pecan-chicken-bites-horizontal-2-jpg-1600902502.jpg?crop=0.670xw:1.00xh;0.183xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200302-chicken-teriyaki-pineapple-bowls-0231-landscape-pf-1-1590003019.jpg?crop=0.550xw:0.825xh;0.176xw,0.132xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/slow-cooker-chicken-fajitas-1532033841.jpg?crop=0.6796xw:1xh;center,top&resize=980:*",
]

Product.create!(name: steak_names[0], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[0], restaurant_id: 1, category: 'Steak')
Product.create!(name: steak_names[1], price: Faker::Number.decimal(l_digits: 2),image_url: steak_images[1], restaurant_id: 1, category: 'Steak')
Product.create!( name: steak_names[2], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[2], restaurant_id: 1, category: 'Steak')
Product.create!(name: steak_names[3], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[3], restaurant_id: 1, category: 'Steak')

Product.create!(name: soup_names[0], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[0], restaurant_id: 1, category: 'Soup')
Product.create!(name: soup_names[1], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[1], restaurant_id: 1, category: 'Soup')
Product.create!(name: soup_names[2], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[2], restaurant_id: 1, category: 'Soup')
Product.create!(name: soup_names[3], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[3], restaurant_id: 1, category: 'Soup')

Product.create!(name: salad_names[0], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[0], restaurant_id: 1, category: 'Salad')
Product.create!(name: salad_names[1], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[1], restaurant_id: 1, category: 'Salad')
Product.create!(name: salad_names[2], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[2], restaurant_id: 1, category: 'Salad')
Product.create!(name: salad_names[3], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[3], restaurant_id: 1, category: 'Salad')

Product.create!(name: chicken_names[0], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[0], restaurant_id: 1, category: 'Chicken')
Product.create!(name: chicken_names[1], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[1], restaurant_id: 1, category: 'Chicken')
Product.create!(name: chicken_names[2], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[2], restaurant_id: 1, category: 'Chicken')
Product.create!(name: chicken_names[3], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[3], restaurant_id: 1, category: 'Chicken')



Product.create!(name: steak_names[4], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[4], restaurant_id: 2, category: 'Steak')
Product.create!(name: steak_names[5], price: Faker::Number.decimal(l_digits: 2),image_url: steak_images[5], restaurant_id: 2, category: 'Steak')
Product.create!( name: steak_names[6], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[6], restaurant_id: 2, category: 'Steak')
Product.create!(name: steak_names[7], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[7], restaurant_id: 2, category: 'Steak')

Product.create!(name: soup_names[4], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[4], restaurant_id: 2, category: 'Soup')
Product.create!(name: soup_names[5], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[5], restaurant_id: 2, category: 'Soup')
Product.create!(name: soup_names[6], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[6], restaurant_id: 2, category: 'Soup')
Product.create!(name: soup_names[7], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[7], restaurant_id: 2, category: 'Soup')

Product.create!(name: salad_names[4], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[0], restaurant_id: 2, category: 'Salad')
Product.create!(name: salad_names[5], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[1], restaurant_id: 2, category: 'Salad')
Product.create!(name: salad_names[6], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[2], restaurant_id: 2, category: 'Salad')
Product.create!(name: salad_names[7], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[3], restaurant_id: 2, category: 'Salad')

Product.create!(name: chicken_names[0], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[0], restaurant_id: 2, category: 'Chicken')
Product.create!(name: chicken_names[1], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[1], restaurant_id: 2, category: 'Chicken')
Product.create!(name: chicken_names[2], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[2], restaurant_id: 2, category: 'Chicken')
Product.create!(name: chicken_names[3], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[3], restaurant_id: 2, category: 'Chicken')


Product.create!(name: steak_names[8], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[8], restaurant_id: 3, category: 'Steak')
Product.create!(name: steak_names[9], price: Faker::Number.decimal(l_digits: 2),image_url: steak_images[9], restaurant_id: 3, category: 'Steak')
Product.create!( name: steak_names[10], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[10], restaurant_id: 3, category: 'Steak')
Product.create!(name: steak_names[11], price: Faker::Number.decimal(l_digits: 2), image_url: steak_images[11], restaurant_id: 3, category: 'Steak')

Product.create!(name: soup_names[8], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[8], restaurant_id: 3, category: 'Soup')
Product.create!(name: soup_names[9], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[9], restaurant_id: 3, category: 'Soup')
Product.create!(name: soup_names[10], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[10], restaurant_id: 3, category: 'Soup')
Product.create!(name: soup_names[11], price: Faker::Number.decimal(l_digits: 2), image_url: soup_images[11], restaurant_id: 3, category: 'Soup')

Product.create!(name: salad_names[8], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[8], restaurant_id: 3, category: 'Salad')
Product.create!(name: salad_names[9], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[9], restaurant_id: 3, category: 'Salad')
Product.create!(name: salad_names[10], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[10], restaurant_id: 3, category: 'Salad')
Product.create!(name: salad_names[11], price: Faker::Number.decimal(l_digits: 2), image_url: salad_images[11], restaurant_id: 3, category: 'Salad')

Product.create!(name: chicken_names[0], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[0], restaurant_id: 3, category: 'Chicken')
Product.create!(name: chicken_names[1], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[1], restaurant_id: 3, category: 'Chicken')
Product.create!(name: chicken_names[2], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[2], restaurant_id: 3, category: 'Chicken')
Product.create!(name: chicken_names[3], price: Faker::Number.decimal(l_digits: 2), image_url: chicken_images[3], restaurant_id: 3, category: 'Chicken')




