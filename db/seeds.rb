# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@gmail.com",
  password: "000000"
)

User.create!(
  name: "山田太郎",
  display_name: "山田",
  email: "yamada.taro@gmail.com",
  password: "111111"
)
User.create!(
  name: "ジョンスミス",
  display_name: "ジョン",
  email: "jon.sumisu@gmail.com",
  password: "111111"
)

