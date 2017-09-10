Article.destroy_all
Category.destroy_all

tags = ["Scuba", "Travel", "Kayaking", "Outdoors", "Hiking", "Sailing", "Extreame", "Lifestyle", "Sports", "Running"]
categories = ["Sports", "Travel", "Outdoors", "Lifestyle"]

categories.each do |cat|
	Category.create(title: cat)
end

10.times do
	tags_list = tags.shuffle[0, rand(1..5)]
	Article.create({title:Faker::Hipster.sentence, 
										body:"#{Faker::Hipster.paragraph(20)}<br><br>#{Faker::Hipster.paragraph(20)}<br><br>#{Faker::Hipster.paragraph(15)}",
										author:Faker::Hobbit.character,
										image: File.new("/home/pete/Pictures/tempImgs/#{rand(1..12)}.jpg"),
										tag_list: tags_list,
										category_id: rand(1..4)
										})
end

Article.all.to_a[0..2].each do |article|
	article.update(featured: true)
end
