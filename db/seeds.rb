require 'faker'

user = User.new(
  username: 'Steve',
  email: 'steve@email.com',
  password: '12345678')
user.save

user2 = User.new(
  username: 'Amy',
  email: 'amy@email.com',
  password: '12345678')
user2.save



date = "2016-" + rand(1..12).to_s + "-" + rand(1..28).to_s
description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."


  Image.create(
    user_id: 1,
    tileset_name: "Heron's Head Park",
    map: "whelpley.4m1jc8ad",
    date_taken: date,
    description: "Photo taken by the Skylark team in Bay View, Hunters Point. It was a sunny beautiful day, and we learned how to run DroneDeploy software for image registration and mosaiking.",
    camera_type: "DJI Phantom 3 Advanced"
    )

    Image.create(
    user_id: 1,
    tileset_name: "Nil's backyard",
    map: "karlaking2.0pe6uqfc",
    date_taken: date,
    description: "Nil was here",
    camera_type: "DJI Phantom 3 Advanced"
    )

   Image.create(
    user_id: 1,
    tileset_name: "Japanese Garden",
    map: "karlaking2.7mbdrc0w",
    date_taken: date,
    description: "754 Band Combination",
    camera_type: "Landsat 8 ETM"
    )

   Image.create(
    user_id: 2,
    tileset_name: "Paris, France",
    map: "karlaking2.3s1aq4mg",
    date_taken: date,
    description: "652 Band Combination",
    camera_type: "Landsat 8 ETM"
    )

  Image.create(
    user_id: 2,
    tileset_name: "North Korea",
    map: "karlaking2.9vlux58h",
    date_taken: date,
    description: "543 Band Combination",
    camera_type: "Landsat 8 ETM"
    )


  Image.create(
    user_id: 2,
    tileset_name: "Turkey",
    map: "karlaking2.1ai436u8",
    date_taken: date,
    description: "564 Band Combination",
    camera_type: "Landsat 8 ETM"
    )

  Image.create(
    user_id: 2,
    tileset_name: "",
    map: "",
    date_taken: date,
    description: " Band Combination",
    camera_type: "Landsat 8 ETM"
    )

  Image.create(
    user_id: 2,
    tileset_name: "Upper Peninsula Michigan",
    map: "karlaking2.dm8mbfy2",
    date_taken: date,
    description: "Color Band Combination",
    camera_type: "Landsat 8 ETM"
    )


