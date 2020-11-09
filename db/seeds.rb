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
      longitude: restaurant["restaurant"]["location"]["longitude"],
      cuisines: restaurant["restaurant"]["cuisines"]
    )}
end
restaurants_array(api_0)
restaurants_array(api_1)
restaurants_array(api_2)
restaurants_array(api_3)
restaurants_array(api_4)
##############################################################################################

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
    "Butter Pecan Chicken Bites",
    "Instant Pot Chicken & Rice",
    "Szechuan Chicken",
    "Cheesy Chicken & Corn Skillet",
    "Cajun Chicken",
    "Chicken Fried Rice",
    "Harvest Chicken Casserole",
    "Crock-Pot Chicken Drumsticks",
    "Slow-Cooker Chicken Thighs",
    "Chicken Stuffing Casserole",
    "Spicy Chicken Taquitos",
    "Chicken Curry",
    "Blackened Chicken",
]

chicken_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/brick-chick-40-1602008992.jpg?crop=0.5625xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190130-korean-fried-chicken-horizontal-041-1549304734.jpg?crop=0.502xw:1.00xh;0.139xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/butter-pecan-chicken-bites-horizontal-2-jpg-1600902502.jpg?crop=0.670xw:1.00xh;0.183xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200302-chicken-teriyaki-pineapple-bowls-0231-landscape-pf-1-1590003019.jpg?crop=0.550xw:0.825xh;0.176xw,0.132xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/slow-cooker-chicken-fajitas-1532033841.jpg?crop=0.6796xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/butter-pecan-chicken-bites-horizontal-2-jpg-1600902502.jpg?crop=0.670xw:1.00xh;0.183xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190508-instant-pot-chicken-and-rice-horizontal-3-1558017055.png?crop=0.668xw:1.00xh;0.196xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/szechuan-chicken-horizontal-1526594491.jpg?crop=0.667xw:1.00xh;0.170xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-cheesy-chicken-and-corn-skillet-still001-1602518882.jpg?crop=0.461xw:0.820xh;0.324xw,0.117xh&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/18/1280x1280/square-1462203290-delish-cajun-stuffed-chicken-2.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/chicken-fried-rice-horizontal-1545488885.png?crop=0.668xw:1.00xh;0.0994xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/39/1600x1600/square-1506456246-delish-healthy-chicken-casserole-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/crock-pot-chicken-drumsticks-horizontal-1537306233.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/34/1600x1600/square-1503418862-chicken-thighs-delish.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/chicken-stuffing-casserole-horizontal-1534340465.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190801-air-fryer-taquitos-0097-landscape-pf-1565972419.jpg?crop=0.535xw:0.803xh;0.231xw,0.0913xh&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/31/1501791674-delish-chicken-curry-horizontal.jpg?crop=0.665xw:0.998xh;0.139xw,0.00240xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-blackened-chicken-horizontal-ql-1598921803.jpg?crop=0.670xw:1.00xh;0.261xw,0&resize=980:*",
]

sushi_names = [
    'Fruity Pebbles Sushi',
    'California Sushi Bites',
    "Cauliflower Sushi Stacks",
    "Picke Sushi",
    "Burger-Sushi",
    "BLT Sushi",
    "Banana Sushi",
    "Zucchini Sushi",
    "Sushi Donuts",
]

sushi_images = [
    'https://hips.hearstapps.com/del.h-cdn.co/assets/17/28/768x768/square-1500072862-delish-delish-kids-fruity-pebbles-sushi-1.jpg?resize=980:*',
    "https://hips.hearstapps.com/vidthumb/images/california-sushi-bites-horizontal-1553719564.png?crop=0.559xw:1.00xh;0.221xw,0&resize=980:*",
    "https://hips.hearstapps.com/vidthumb/images/04-cauliflower-sushi-stacks-final-wide-00-01-24-21-still019-1595603750.jpg?crop=0.5625xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/17/1024x1024/square-1493303114-delish-pickle-sushi-3.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/39/1280x1280/square-1475022512-highclass-hillbilly-horizontal.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/07/768x768/square-1487260764-delish-blt-sushi-2.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/39/980x980/square-1506717388-delish-kids-banana-sushi-ytpin.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/14/1024x1024/square-1491232225-delish-zucchini-sushi-01.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/18/1024x1024/square-1493901165-delish-sushi-donuts-1.jpg?resize=980:*"
]

sides_names = [
    "Perfect Mashed Cauliflower",
    "Roasted Carrots",
    "Asparagus ",
    "Roasted Red Potatoes",
    "Arugula Salad",
    "Baked Zucchini",
    "Cheesy Mushroom",
]

sides_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190620-mashed-cauliflower-0739-landscape-pf-1564069927.jpg?crop=0.668xw:1.00xh;0.131xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/18/09/1600x1600/square-1519653814-delish-roasted-carrots-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/18/09/1600x1600/square-1519653347-delish-roasted-asparagus-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191113-roasted-red-potatos-0252-landscape-pf-1574656880.jpg?crop=0.614xw:0.921xh;0.183xw,0.0649xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-arugula-salad-jpg-1526060277.jpg?crop=0.668xw:1.00xh;0.0769xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190514-baked-zucchini-landscape-040-pf-1559077316.jpg?crop=0.657xw:0.986xh;0.133xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-cheesy-mushrrom-skillet-still001-1554732301.jpg?crop=0.447xw:0.795xh;0.261xw,0.0769xh&resize=980:*",
]

bakery_names = [
   "Cranbeerry Bites",
   'Red Velvet Cookies',
   "Apple Pie Bites",
   "Chocolate Caramel Pops",
   'Keto Lemon Bars',
   "Cookie Dough",
   "Twix pie"
]

bakery_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-cranberry-crumb-bars-still001-1604592427.jpg?crop=0.513xw:0.912xh;0.244xw,0.0598xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200813-red-velvet-cookies-n-cream-bars-2720-landscape-yaedit-1604077224.jpeg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/apple-pie-bars-1536693077.png?crop=0.668xw:1.00xh;0.234xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-dixie-cup-chocolate-dipped-ice-cream-bars-still002-1597162098.jpg?crop=0.425xw:0.755xh;0.308xw,0.114xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-keto-lemon-bars-still002-copy-1558918123.png?crop=0.479xw:0.852xh;0.311xw,0.0570xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200310-keto-cookie-dough-bars-horizontal-13244-eb-1584471945.jpg?crop=0.668xw:1.00xh;0.0353xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/49/1024x1024/square-1512665843-delish-twix-pie-still003.jpg?resize=980:*"
]

bar_names = [
    "Classic Buffalo Wings",
    'Lover Meat Burger',
    "Frech Fries",
    "Chicken Tenders",
    "Asparagus and Pancetta",
    "Tacos",
    "Pulled Pork Chili"
]

bar_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/classic-buffalo-wings-horizontal-279-1547506155.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/screen-shot-2020-07-23-at-10-21-20-am-1595517942.png?crop=0.736xw:1.00xh;0.184xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/28/1024x1024/square-1468426685-fries.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/15/19/1431036057-chicken-tenders-honey-mustard.jpg?crop=0.7975xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/cm/15/10/54f8b9b8a3a40_-_gemelli-pasta-large-new.jpg?crop=1xw:0.75xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/cm/15/10/480x480/54f9525fa4c55_-_tacos-del0714-def.jpg?resize=980:*",
    "https://hips.hearstapps.com/vidthumb/images/screen-shot-2019-09-13-at-4-42-55-pm-1568407401.png?crop=0.5581395348837209xw:1xh;center,top&resize=980:*"
]

seafood_names = [
    "Seafood Spagethetti",
    "Shrimp & Sausage Gumbo",
    "Seafood Lasagna",
    "Seafood Mixer",
    "Grill Fish",
    "Gefilte Fish",
    "Mussels Tomato Soup",
    "Fried Calamari ",
    "Pineapple Salmon Skewers"
]

seafood_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-seafood-spaghetti-3new-1534500370.jpg?crop=0.5621890547263682xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/31/1600x1600/square-1501791933-delish-gumbo-horizontal.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-seafood-lasagna-still010-1537393431.jpg?crop=0.5625xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/15/53/980x980/square-1451411348-octopus-salad.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/17/3200x3200/square-1461781777-gettyimages-502603422.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gifilte-fish-horizontal-jpg-1521486750.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/28/640x640/square-1499895381-mussels-tomato-garlic-delish.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/squid-andalusian-royalty-free-image-184117668-1554317792.jpg?crop=0.969xw:1.00xh;0.0163xw,0&resize=980:*",
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190523-pineapple-salmon-skewers-338-1559938752.png?crop=0.606xw:0.909xh;0.141xw,0.0913xh&resize=980:*'
]

bbq_names = [
    "BBQ Oven-Baked Ribs",
    "Cheft Special Steak Bites",
    "Chicken Cauliflower",
    "BBQ Lime Brussels Sprouts",
    "Baked BBQ Chicken",
    "Grilled Chicken + Yellow Corn",
    "Shortcute BBQ Ribs",
    "Asian BBQ Grilled Salmon",
    "Grilled Potatoes"
]

bbq_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200302-over-baked-ribs-0185-landscape-pf-1590087100.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/netflix-chefs-table-bbq-1597769683.jpg?crop=0.503xw:1.00xh;0,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/18/1024x1024/square-1462465984-crack-cauliflower-003.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/46/1024x1024/square-1510957760-delish-crack-brussels-sprouts-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190410-oven-barbecue-chicken-369-1555947776.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/21/1280x1280/square-1464125618-delish-bbq-grilled-chicken.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200302-over-baked-ribs-0192-landscape-pf-1590087101.jpg?crop=0.6668421052631579xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190510-barbecue-salmon-horizontal-1-1558117451.png?crop=0.668xw:1.00xh;0.167xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-grilled-potatoes-jpg-1526061594.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=980:*"
]

bagels_names = [
    "Keto Bagels",
    "Pizza Waffles",
    "Bagel Mixer",
    "Toasted Egg Bagels",
    "Bagel Kreme Challenge",
    "Bagel Dogs",
    "Bagel Bites",
    "Bagel Cream Ring",
    "Espresso Buzz Bagel"
]

bagels_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-keto-bagels-horizontal-2-1543886532.jpg?crop=0.668xw:1.00xh;0.333xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/45/1280x1280/square-1510169092-pizza-waffles-delish-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20191219-seo-bagel-recipe-delish-ehg-8856-1578412004.jpg?crop=0.668xw:1.00xh;0.260xw,0.00240xh&resize=980:*",
    "https://hips.hearstapps.com/vidthumb/images/delish-everything-toast-egg-cups-still002-1551379468.jpg?crop=0.5625xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/29/1024x1024/square-1500413710-delish-krispy-kreme-bagel-still1.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/29/640x640/square-1469116020-delish-everything-bagel-dogs-grab.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/11/1024x1024/square-1489780164-bfast-bagel-bites-01.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-bacon-scallion-cream-cheese-with-everything-bagel-ring-1-1534196375.jpg?crop=0.564xw:1.00xh;0.196xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/18/1280x1280/square-1494006508-espresso-buzz-bagel.jpg?resize=980:*",
]

tea_names = [
    "Thai Iced Tea",
    "Long Island Iced Tea",
    "Apple Cider Tea",
    "Peach Tea",
    "Thai Iced Tea",

]

tea_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/200824-delish-thai-iced-tea-horizontalpour1-15407-eb-1598987409.jpg?crop=0.670xw:1.00xh;0.138xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/long-island-applebees-1571433826.jpg?crop=0.5258333333333334xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/apple-cider-long-island-iced-tea-03-1567182533.jpg?crop=0.564xw:1.00xh;0.220xw,0&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/16/19/1280x1280/square-1463088129-sweet-tea-sangria.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/200824-delish-thai-iced-tea-horizontalpour1-15407-eb-1598987409.jpg?crop=0.670xw:1.00xh;0.138xw,0&resize=980:*",
]

cocktail_names = [
    "Memorial Day",
    "Mayo Tequila",
    "Tiramisu Martini",
    "Painkiller Drink",
    "Fourth Of July",
    "Strawberry Mixer",
    "Memorial Day",
]

cocktail_images = [
    "https://hips.hearstapps.com/del.h-cdn.co/assets/15/32/3200x3200/square-1438819263-delish-layered-vodka-lemonade.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/17/21/1024x1024/square-1495747562-delish-pink-senoritas-3-lf.jpg?resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/15/50/1280x1280/square-1449780642-gingerbread-header-1.jpg?resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-painkiller-cocktail-still001-1600709160.jpg?crop=0.564xw:1.00xh;0.220xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-blueberry-lemonade-margs-still001-1528494858.jpg?crop=0.564xw:1.00xh;0.228xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-191017-brunch-punch-0211-landscape-pf-1583527183.jpg?crop=0.544xw:0.817xh;0.448xw,0.0685xh&resize=980:*",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/15/32/3200x3200/square-1438819263-delish-layered-vodka-lemonade.jpg?resize=980:*",
]

beer_names = [
    "Sour Me Beer",
    "Coffe Stout Beer",
    "French Toast Stout Beer",
    "Bush Light Beer",
    "Flight Beer",
    "PumpKin Beer",
    "Blue Moon Coffee",
    "Patagonia",
    "Ultra Infusions"
]

beer_images = [
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/uf-poured-1552403183.jpg?crop=0.521xw:0.925xh;0.239xw,0.0751xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/wawa-1575311646.png?crop=0.623xw:1.00xh;0.0369xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/french-toast-beer1-1545410051.jpg?crop=0.501xw:1.00xh;0.0397xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/screen-shot-2020-02-11-at-11-55-01-am-1581440111.png?crop=0.413xw:1.00xh;0.295xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/flight-by-yuengling-beer-social-1582643096.jpg?crop=0.500xw:1.00xh;0.500xw,0&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pumpkin-1599764468.jpg?crop=0.498xw:0.886xh;0,0.0484xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/blue-moon-iced-coffee-blonde-1568658724.jpg?crop=0.5xw:1xh;center,top&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/patagonia-anheuser-busch-inbev-beer-lawsuit-1555005457.jpg?crop=0.438xw:0.876xh;0.562xw,0.0293xh&resize=980:*",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/michelob-ultra-infusions-hero-image-1553099082.jpg?crop=0.825xw:1.00xh;0.0881xw,0&resize=980:*"

]

    # Restaurant 1
    8.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 1, category: 'Specialties') end 
    4.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 1, category: 'Popular') end 
    4.times do |i| Product.create!(name: chicken_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+1], restaurant_id: 1, category: 'Popular') end 
    8.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 1, category: 'Roots') end 
    2.times do |i| Product.create!(name: chicken_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+10], restaurant_id: 1, category: 'Signature') end 
    2.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 1, category: 'Signature') end 
    8.times do |i| Product.create!(name: beer_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+1], restaurant_id: 1, category: 'Drinks') end 

    # Restaurant 2
    8.times do |i| Product.create!(name: steak_names[i+9], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+9], restaurant_id: 2, category: 'Popular') end 
    4.times do |i| Product.create!(name: soup_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+5], restaurant_id: 2, category: 'Specialties') end 
    4.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+5], restaurant_id: 2, category: 'Specialties') end 
    8.times do |i| Product.create!(name: salad_names[i+9], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+9], restaurant_id: 2, category: 'Roots') end 
    4.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 2, category: 'Signature') end 
    8.times do |i| Product.create!(name: beer_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+1], restaurant_id: 2, category: 'Drinks') end 


    # Restaurant 3
    8.times do |i| Product.create!(name: sushi_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sushi_images[i+1], restaurant_id: 3, category: 'Popular') end 
    4.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 3, category: 'Specialties') end
    4.times do |i| Product.create!(name: chicken_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+1], restaurant_id: 3, category: 'Specialties') end 
    8.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 3, category: 'Roots') end 
    4.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 3, category: 'Signature') end 
    4.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 3, category: 'Drinks') end 

    # Restaurant 4
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 4, category: 'Popular') end 
    3.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 4, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+1], restaurant_id: 4, category: 'Specialties') end 
    4.times do |i| Product.create!(name: salad_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+10], restaurant_id: 4, category: 'Roots') end 
    2.times do |i| Product.create!(name: steak_names[i+7], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+7], restaurant_id: 4, category: 'Signature') end 
    6.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 4, category: 'Drinks') end 

    # Restaurant 5
    8.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 5, category: 'Popular') end 
    3.times do |i| Product.create!(name: steak_names[i+4], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+4], restaurant_id: 5, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+4], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+4], restaurant_id: 5, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 5, category: 'Roots') end 
    2.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 5, category: 'Signature') end 
    6.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 5, category: 'Drinks') end 
    

    # Restaurant 6
    8.times do |i| Product.create!(name: steak_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+15], restaurant_id: 6, category: 'Popular') end 
    3.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 6, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+4], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+4], restaurant_id: 6, category: 'Specialties') end 
    6.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 6, category: 'Roots') end 
    2.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 6, category: 'Signature') end 
    6.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 6, category: 'Drinks') end 
        

    # Restaurant 7
    8.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 7, category: 'Popular') end 
    3.times do |i| Product.create!(name: bbq_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+1], restaurant_id: 7, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+4], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+4], restaurant_id: 7, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 7, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+10], restaurant_id: 7, category: 'Signature') end 
    4.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 7, category: 'Drinks') end 
        
    # Restaurant 8
    8.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 8, category: 'Popular') end 
    3.times do |i| Product.create!(name: bbq_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+1], restaurant_id: 8, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+4], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+4], restaurant_id: 8, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 8, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+10], restaurant_id: 8, category: 'Signature') end 
    6.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 8, category: 'Drinks') end 
     

    # Restaurant 9
    8.times do |i| Product.create!(name: sushi_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 9, category: 'Popular') end 
    3.times do |i| Product.create!(name: steak_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+20], restaurant_id: 9, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+14], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+14], restaurant_id: 9, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 9, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+5], restaurant_id: 9, category: 'Signature') end 
    4.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 9, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+1], restaurant_id: 9, category: 'Drinks') end 

    # Restaurant 10
    8.times do |i| Product.create!(name: steak_names[i+13], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+13], restaurant_id: 10, category: 'Popular') end 
    3.times do |i| Product.create!(name: bagels_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: bagels_images[i+2], restaurant_id: 10, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+7], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+7], restaurant_id: 10, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 10, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+8], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+8], restaurant_id: 10, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 10, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+1], restaurant_id: 10, category: 'Drinks') end 
    
    # Restaurant 11
    8.times do |i| Product.create!(name: chicken_names[i+13], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+13], restaurant_id: 11, category: 'Popular') end 
    3.times do |i| Product.create!(name: bbq_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+2], restaurant_id: 11, category: 'Specialties') end 
    3.times do |i| Product.create!(name: steak_names[i+7], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+7], restaurant_id: 11, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 11, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+8], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+8], restaurant_id: 11, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+2], restaurant_id: 11, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+4], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+4], restaurant_id: 11, category: 'Drinks') end 
    
    # Restaurant 12
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 12, category: 'Popular') end 
    3.times do |i| Product.create!(name: bbq_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+2], restaurant_id: 12, category: 'Specialties') end 
    3.times do |i| Product.create!(name: sides_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+1], restaurant_id: 12, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 12, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+10], restaurant_id: 12, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+2], restaurant_id: 12, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+4], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+4], restaurant_id: 12, category: 'Drinks') end 
    

    # Restaurant 13
    6.times do |i| Product.create!(name: bbq_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+1], restaurant_id: 13, category: 'Popular') end 
    3.times do |i| Product.create!(name: steak_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+2], restaurant_id: 13, category: 'Specialties') end 
    3.times do |i| Product.create!(name: sides_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+1], restaurant_id: 13, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+8], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+8], restaurant_id: 13, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+12], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+12], restaurant_id: 13, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+2], restaurant_id: 13, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+4], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+4], restaurant_id: 13, category: 'Drinks') end 
    
    # Restaurant 14
    6.times do |i| Product.create!(name: chicken_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+1], restaurant_id: 14, category: 'Popular') end 
    3.times do |i| Product.create!(name: steak_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+2], restaurant_id: 14, category: 'Specialties') end
    3.times do |i| Product.create!(name: sides_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+3], restaurant_id: 14, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 14, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+20], restaurant_id: 14, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+2], restaurant_id: 14, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+4], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+4], restaurant_id: 14, category: 'Drinks') end 
    
    # Restaurant 15
    6.times do |i| Product.create!(name: seafood_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+2], restaurant_id: 15, category: 'Popular') end 
    3.times do |i| Product.create!(name: bbq_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+2], restaurant_id: 15, category: 'Specialties') end 
    3.times do |i| Product.create!(name: sides_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+3], restaurant_id: 15, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 15, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+5], restaurant_id: 15, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 15, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+6], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+6], restaurant_id: 15, category: 'Drinks') end 
    
    # Restaurant 16
    6.times do |i| Product.create!(name: sides_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+1], restaurant_id: 16, category: 'Popular') end 
    3.times do |i| Product.create!(name: steak_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+2], restaurant_id: 16, category: 'Specialties') end 
    3.times do |i| Product.create!(name: sides_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+3], restaurant_id: 16, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 16, category: 'Roots') end 
    2.times do |i| Product.create!(name: seafood_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+5], restaurant_id: 16, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 16, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+6], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+6], restaurant_id: 16, category: 'Drinks') end 
    

    # Restaurant 17
    5.times do |i| Product.create!(name: sides_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+2], restaurant_id: 17, category: 'Popular') end 
    3.times do |i| Product.create!(name: chicken_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+2], restaurant_id: 17, category: 'Specialties') end 
    3.times do |i| Product.create!(name: sides_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+3], restaurant_id: 17, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+12], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+12], restaurant_id: 17, category: 'Roots') end 
    2.times do |i| Product.create!(name: seafood_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+3], restaurant_id: 17, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 17, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+6], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+6], restaurant_id: 17, category: 'Drinks') end 
    

    # Restaurant 18
    5.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 18, category: 'Popular') end 
    3.times do |i| Product.create!(name: chicken_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+10], restaurant_id: 18, category: 'Specialties') end 
    3.times do |i| Product.create!(name: seafood_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+3], restaurant_id: 18, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+2], restaurant_id: 18, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+3], restaurant_id: 18, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 18, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+6], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+6], restaurant_id: 18, category: 'Drinks') end 
    
    # Restaurant 19
    5.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 19, category: 'Popular') end 
    3.times do |i| Product.create!(name: chicken_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+1], restaurant_id: 19, category: 'Specialties') end 
    3.times do |i| Product.create!(name: steak_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+20], restaurant_id: 19, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+20], restaurant_id: 19, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+10], restaurant_id: 19, category: 'Signature') end 
    4.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 19, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 19, category: 'Drinks') end 
    
    # Restaurant 20
    5.times do |i| Product.create!(name: seafood_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+3], restaurant_id: 20, category: 'Popular') end 
    3.times do |i| Product.create!(name: bbq_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+1], restaurant_id: 20, category: 'Specialties') end 
    3.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 20, category: 'Specialties') end 
    6.times do |i| Product.create!(name: soup_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+20], restaurant_id: 20, category: 'Roots') end 
    2.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 20, category: 'Signature') end 
    4.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 20, category: 'Drinks') end 
    2.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 20, category: 'Drinks') end 
    
    # Restaurant 21
    5.times do |i| Product.create!(name: sushi_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sushi_images[i+1], restaurant_id: 21, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 21, category: 'Specialties') end 
    3.times do |i| Product.create!(name: steak_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+5], restaurant_id: 21, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+2], restaurant_id: 21, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 21, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 21, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 21, category: 'Drinks') end 

    # Restaurant 22
    5.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 22, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 22, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+5], restaurant_id: 22, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+2], restaurant_id: 22, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 22, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 22, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 22, category: 'Drinks') end 
    
    # Restaurant 23
    5.times do |i| Product.create!(name: bagels_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bagels_images[i+1], restaurant_id: 23, category: 'Popular') end 
    5.times do |i| Product.create!(name: bakery_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bakery_images[i+1], restaurant_id: 23, category: 'Specialties') end 
    3.times do |i| Product.create!(name: sides_names[i+3], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+3], restaurant_id: 23, category: 'Specialties') end 
    4.times do |i| Product.create!(name: bar_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+2], restaurant_id: 23, category: 'Roots') end 
    5.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 23, category: 'Signature') end 
    4.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 22, category: 'Drinks') end 
        
    # Restaurant 24
    5.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 24, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 24, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 24, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 24, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 24, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 24, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 24, category: 'Drinks') end 
    
    # Restaurant 25
    5.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 25, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 25, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 25, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 25, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 25, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 25, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 25, category: 'Drinks') end 
    

    # Restaurant 26
    5.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 26, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+20], restaurant_id: 26, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 26, category: 'Specialties') end 
    4.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 26, category: 'Roots') end 
    6.times do |i| Product.create!(name: salad_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+10], restaurant_id: 26, category: 'Signature') end 
    4.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 26, category: 'Drinks') end 
    5.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 26, category: 'Drinks') end 
    

    # Restaurant 27
    5.times do |i| Product.create!(name: bbq_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+1], restaurant_id: 27, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+20], restaurant_id: 27, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 27, category: 'Specialties') end 
    6.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 27, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 27, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 27, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 27, category: 'Drinks') end 

    # Restaurant 28
    5.times do |i| Product.create!(name: steak_names[i+11], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+11], restaurant_id: 28, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+11], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+11], restaurant_id: 28, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+11], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+11], restaurant_id: 28, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 28, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+11], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+11], restaurant_id: 28, category: 'Signature') end 
    3.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 28, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 28, category: 'Drinks') end 
    
    # Restaurant 29
    4.times do |i| Product.create!(name: bbq_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bbq_images[i+1], restaurant_id: 29, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+5], restaurant_id: 29, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+5], restaurant_id: 29, category: 'Specialties') end 
    4.times do |i| Product.create!(name: seafood_names[i+2], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+2], restaurant_id: 29, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+5], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+5], restaurant_id: 29, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 29, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 29, category: 'Drinks') end 
    
    # Restaurant 30
    5.times do |i| Product.create!(name: sushi_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sushi_images[i+1], restaurant_id: 30, category: 'Popular') end 
    8.times do |i| Product.create!(name: soup_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+20], restaurant_id: 30, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 30, category: 'Roots') end 
    4.times do |i| Product.create!(name: chicken_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+10], restaurant_id: 30, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 30, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 30, category: 'Drinks') end 
    
    # Restaurant 31
    5.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 31, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 31, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 31, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 31, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 31, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 31, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 31, category: 'Drinks') end 
    
    # Restaurant 32
    5.times do |i| Product.create!(name: steak_names[i+11], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+11], restaurant_id: 32, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+10], restaurant_id: 32, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 32, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 32, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 32, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 32, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 32, category: 'Drinks') end 
    
    # Restaurant 33
    5.times do |i| Product.create!(name: steak_names[i+21], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+21], restaurant_id: 33, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+20], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+20], restaurant_id: 33, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+25], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+25], restaurant_id: 33, category: 'Specialties') end 
    6.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 33, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 33, category: 'Signature') end 
    2.times do |i| Product.create!(name: cocktail_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: cocktail_images[i+1], restaurant_id: 33, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 33, category: 'Drinks') end 
    
    # Restaurant 34
    5.times do |i| Product.create!(name: bakery_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bakery_images[i+1], restaurant_id: 34, category: 'Popular') end 
    5.times do |i| Product.create!(name: sides_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+1], restaurant_id: 34, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 34, category: 'Specialties') end 
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 34, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 34, category: 'Signature') end 
    2.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 34, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 34, category: 'Drinks') end 
    
    # Restaurant 35
    4.times do |i| Product.create!(name: bakery_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bakery_images[i+1], restaurant_id: 35, category: 'Popular') end 
    5.times do |i| Product.create!(name: bagels_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bagels_images[i+1], restaurant_id: 35, category: 'Specialties') end 
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 34, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 34, category: 'Signature') end 
    2.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 34, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 34, category: 'Drinks') end 
    
    # Restaurant 36
    5.times do |i| Product.create!(name: suhi_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sushi_images[i+1], restaurant_id: 36, category: 'Popular') end 
    5.times do |i| Product.create!(name: soup_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+1], restaurant_id: 36, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 36, category: 'Specialties') end 
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 36, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 36, category: 'Signature') end 
    2.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 36, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+3], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+3], restaurant_id: 36, category: 'Drinks') end 
    
    # Restaurant 37
    5.times do |i| Product.create!(name: steak_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+1], restaurant_id: 37, category: 'Popular') end 
    5.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 37, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 37, category: 'Specialties') end 
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 37, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 37, category: 'Signature') end 
    2.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 37, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 37, category: 'Drinks') end 
    
    # Restaurant 38
    5.times do |i| Product.create!(name: chicken_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+1], restaurant_id: 38, category: 'Popular') end 
    5.times do |i| Product.create!(name: sides_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+1], restaurant_id: 38, category: 'Specialties') end 
    3.times do |i| Product.create!(name: soup_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: soup_images[i+15], restaurant_id: 38, category: 'Specialties') end 
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 38, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 38, category: 'Signature') end 
    2.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 38, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 38, category: 'Drinks') end 
    
    # Restaurant 39
    5.times do |i| Product.create!(name: steak_names[i+10], price: Faker::Number.between(from: 15, to: 35), image_url: steak_images[i+10], restaurant_id: 39, category: 'Popular') end 
    5.times do |i| Product.create!(name: sides_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: sides_images[i+1], restaurant_id: 39, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 39, category: 'Specialties') end 
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 39, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 39, category: 'Signature') end 
    2.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 39, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 39, category: 'Drinks') end 
    
    # Restaurant 40
    5.times do |i| Product.create!(name: seafood_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: seafood_images[i+1], restaurant_id: 40, category: 'Popular') end 
    5.times do |i| Product.create!(name: bakery_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bakery_images[i+1], restaurant_id: 40, category: 'Specialties') end 
    3.times do |i| Product.create!(name: chicken_names[i+15], price: Faker::Number.between(from: 15, to: 35), image_url: chicken_images[i+15], restaurant_id: 40, category: 'Specialties') end 
    6.times do |i| Product.create!(name: bar_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: bar_images[i+1], restaurant_id: 40, category: 'Roots') end 
    4.times do |i| Product.create!(name: salad_names[i+1], price: Faker::Number.between(from: 15, to: 35), image_url: salad_images[i+1], restaurant_id: 40, category: 'Signature') end 
    2.times do |i| Product.create!(name: tea_names[i+1], price: Faker::Number.between(from: 5, to: 15), image_url: tea_images[i+1], restaurant_id: 40, category: 'Drinks') end 
    4.times do |i| Product.create!(name: beer_names[i+2], price: Faker::Number.between(from: 5, to: 15), image_url: beer_images[i+2], restaurant_id: 40, category: 'Drinks') end 
    