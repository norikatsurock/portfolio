# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
	Blog.create!(
		image: open("app/assets/images/forest.jpg"),
		title: "#{i}回目の投稿のテスト"
		body: "#{i}回目の本文の投稿テスト"
		user_id: rand(1..4),
		blog_id: rand(8..35)
		)
end