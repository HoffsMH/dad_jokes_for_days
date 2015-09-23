category = Category.find_by_name("T-shirts")
category.items.create(name: "Mens  T-shirt", description: "100% Cotton", image_url: "fake_url", price: 10.43)
category.items.create(name: "Womens T-shirt", description: "100% Cotton", image_url: "fake url", price: 11.43)

category = Category.find_by_name("HouseHold")
category.items.create(name: "Mug", description: "100% Ceramic", image_url: "fake_url", price: 4.43)

category = Category.find_by_name("Stationery")
category.items.create(name: "Greeting Card", description: "100% Paper", image_url: "fake_url", price: 400.43)
category.items.create(name: "Notepad", description: "100% Paper", image_url: "fake_url", price: 1.43)
