# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Video.destroy_all
Camera.destroy_all
Category.destroy_all


cameras = ["Mevo Plus", "Mevo Start"]
categories = [
  "House of Worship",
  "Sports",
  "Government",
  "Conferences",
  "Education",
  "Gaming",
  "Fitness",
  "Hobbies",
  "Music",
]

cameras.each do |camera|  
  Camera.create(model: camera)
end

categories.each do |category|
  Category.create(name: category)
end

mevo_start = Camera.find_by(model: "Mevo Start")
mevo_plus = Camera.find_by(model: "Mevo Plus")

music = Category.find_by(name: "Music")
worship = Category.find_by(name: "House of Worship")
sports = Category.find_by(name: "Sports")


Video.create(
  title: "Spinning late night records with Mevo",
  description: "DJCity late night set on Jan 1, 1995",
  youtube_url: "https://www.youtube.com/watch?v=aMnh1cw6654",
  user_email: "otto@mevo.com",
  authorized_to_share: true,
  camera: mevo_start,
  category: music
)

Video.create(
  title: "Woodville Grace Brethren Church",
  description: "Weekly service for our community. Mevo placed at the front row.",
  youtube_url: "https://www.youtube.com/watch?v=tTT7fqkO1xk",
  user_email: "otto@mevo.com",
  authorized_to_share: true,
  camera: mevo_plus,
  category: worship
)

Video.create(
  title: "Mevo at our baseball game",
  description: "Used a new Mevo Start to stream from the fence.",
  youtube_url: "https://www.youtube.com/watch?v=vS_4fCEXUUk",
  user_email: "otto@mevo.com",
  authorized_to_share: true,
  camera: mevo_start,
  category: sports
)