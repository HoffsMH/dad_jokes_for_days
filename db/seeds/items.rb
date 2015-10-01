category = Category.find_by_name("T-shirts")
category.items.create(name: "Men's  T-shirt", description: "90% cotton. 100% fun!", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item-mens_t-shirt--600x600.jpg", price: 19.99)
category.items.create(name: "Women's T-shirt", description: "90% cotton. 100% fun!", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item-womens_t-shirt--600x600.jpg", price: 19.99)

category = Category.find_by_name("Household Goods")
category.items.create(name: "Mug", description: "98% ceramic. 100% fun.", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item-mug_with_MUG_joke--600x600.jpg", price: 17.99 )

category = Category.find_by_name("Stationery")
category.items.create(name: "Greeting Card", description: "Share the smiled. 100% paper", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item-greeting_card_with_joke--600x600.jpg", price: 5.99)
category.items.create(name: "Notepad", description: "Keep yourself giggly on a daily basis. 100% paper.", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item-notepad--600x600.jpg", price: 9.99)

category = Category.find_by_name("Décor")
category.items.create(name: "Motivational Poster", description: "A staple for any dad looking to teach his kids a lesson. Printed on the highest quality artisinal paper.", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item-motivational_poster_600.jpg", price: 42.42)
category.items.create(name: "Wall decal", description: "Prove the love you have for your child by giving them the gift of laughter every single day. Removable and restickable so it can grow with your child and never ever get thrown away.", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item_room_decal_600.jpg", price: 34.99)

category = Category.find_by_name("Food Prep")
category.items.create(name: "Apron", description: "Stylish and manly. 100% fun.", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item_apron_600.jpg", price: 31.99)
category.items.create(name: "Chopping Block", description: "The dadly way to show your softer side.", image_url: "https://s3-us-west-2.amazonaws.com/dadjokesfordays/newimages/item_chopping_block_600.jpg", price: 59.99)
