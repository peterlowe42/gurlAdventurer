d# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.destroy_all
Category.destroy_all

tags = ["Scuba", "Travel", "Kayaking", "Outdoors", "Hiking", "Sailing", "Extreame", "Lifestyle", "Sports", "Running"]
categories = ["Sports", "Travel", "Outdoors", "Lifestyle"]

categories.each do |cat|
	Category.create(title: cat)
end

20.times do
	tags_list = tags.shuffle[0, rand(1..5)]
	Article.create({title:Faker::Hipster.sentence, 
										body:"#{Faker::Hipster.paragraph(20)}<br><br>#{Faker::Hipster.paragraph(20)}<br><br>#{Faker::Hipster.paragraph(15)}",
										author:Faker::Hobbit.character,
										image: File.new("/home/pete/Pictures/tempImgs/#{rand(1..12)}.jpg"),
										tag_list: tags_list,
										category_id: rand(1..4)
										})
end



Article.first.update(featured: true)