tags = ["Scuba", "Travel", "Kayaking", "Outdoors", "Hiking", "Sailing", "Extreame", "Lifestyle", "Sports", "Running"]
categories = ["Sports", "Travel", "Outdoors", "Lifestyle"]

categories.each do |cat|
	Category.create(title: cat)
end
