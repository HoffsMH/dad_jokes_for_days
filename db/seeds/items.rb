category = Category.find_by_name("T-shirts")
# file = File.open("/path/to/your/local/image")
# item.image = file
# item.save
category.items.create(name: "Men's  T-shirt", description: "100% Cotton", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/images/mens_t-shirt--420x280.jpg", price: 10.43)
category.items.create(name: "Women's T-shirt", description: "100% Cotton", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/images/womens_t-shirt--420x280.jpg", price: 11.43)

category = Category.find_by_name("Household Items")
category.items.create(name: "Mug", description: "100% Ceramic", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/images/mug_with_MUG_joke--420x280.jpg", price:4.43 )

category = Category.find_by_name("Stationery")
category.items.create(name: "Greeting Card", description: "100% Paper", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/images/greeting_card_with_joke--420x280.jpg", price: 400.43)
category.items.create(name: "Notepad", description: "100% Paper", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/images/notepad--420x280.jpg", price: 1.43)
