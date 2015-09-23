category = Category.find_by_name("T-shirts")
category.items.create(name: "Mens  T-shirt", description: "100% Cotton", image_url: "http://flathash.com/fake_url_01", price: 10.43)
category.items.create(name: "Womens T-shirt", description: "100% Cotton", image_url: "http://flathash.com/fake_url_02", price: 11.43)

category = Category.find_by_name("HouseHold")
category.items.create(name: "Mug", description: "100% Ceramic", image_url: "http://flathash.com/fake_url_03", price:4.43 )

category = Category.find_by_name("Stationery")
category.items.create(name: "Greeting Card", description: "100% Paper", image_url: "http://flathash.com/fake_url_04", price: 400.43)
category.items.create(name: "Notepad", description: "100% Paper", image_url: "http://flathash.com/fake_url_05", price: 1.43)
