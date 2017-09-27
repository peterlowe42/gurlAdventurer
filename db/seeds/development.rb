Article.destroy_all
Category.destroy_all
Writer.destroy_all

tags = ["Scuba", "Travel", "Kayaking", "Outdoors", "Hiking", "Sailing", "Extreame", "Lifestyle", "Sports", "Running"]
categories = ["Sports", "Travel", "Outdoors", "Lifestyle"]

categories.each do |cat|
	Category.create(title: cat)
end

writer_names = [['Sandra', 'Pearson'],['Jane','Doe'],['Maggie','May']]

writer_names.each do |name|
	Writer.create({first_name: name[0],
									last_name: name[1],
									avatar: File.new("/home/pete/Pictures/somelady.jpg"),
									bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})
									
end

10.times do
	tags_list = tags.shuffle[0, rand(1..5)]
	Article.create({title:Faker::Hipster.sentence, 
										body:"#{Faker::Hipster.paragraph(20)}<br><br>#{Faker::Hipster.paragraph(20)}<br><br>#{Faker::Hipster.paragraph(15)}",
										writer_id: rand(1..3),
										image: File.new("/home/pete/Pictures/tempImgs/#{rand(1..12)}.jpg"),
										tag_list: tags_list,
										category_id: rand(1..4)
										})
end

Article.all.to_a[0..2].each do |article|
	article.update(featured: true)
end
