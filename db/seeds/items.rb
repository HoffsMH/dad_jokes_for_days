category = Category.find_by_name("T-shirts")
category.items.create(name: "Mens  T-shirt", description: "100% Cotton")
category.items.create(name: "Womens T-shirt", description: "100% Cotton")

category = Category.find_by_name("HouseHold")
category.items.create(name: "Mug", description: "100% Ceramic")

category = Category.find_by_name("Stationery")
category.items.create(name: "Greeting Card", description: "100% Paper")
category.items.create(name: "Notepad", description: "100% Paper")
