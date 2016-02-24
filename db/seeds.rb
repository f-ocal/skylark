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
    map: "karlaking2.bb43ty0h",
    date_taken: "2016-21-02",
    description: "Photo taken by the Skylark team in Bay View, Hunters Point. It was a sunny beautiful day, and we learned how to run DroneDeploy software for image registration and mosaiking.",
    camera_type: "DJI 3 Phantom Advanced"
    )

  Image.create(
    user_id: 2,
    tileset_name: "Polo Field",
    map: "natasha-t.0222t4x6",
    date_taken: date,
    description: description,
    camera_type: "DJI Phantom"
    )

   Image.create(
    user_id: 2,
    tileset_name: "Lucas Valley, Marin, CA",
    map: "karlaking2.2922mkfg",
    date_taken: date,
    description: description,
    camera_type: "DJI Phantom"
    )


