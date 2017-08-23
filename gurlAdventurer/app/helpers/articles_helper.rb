module ArticlesHelper
	ARTICLE_LIFETIME = 86400 * 7 #7 days converted to seconds

	def process_text(article)
		text = article.body
		article_pics = article.pictures
		image_tags = text.scan(/<-([\s\S]*?)->/).flatten
		image_tags.each do |tag|
			tag_arr = tag.split(',')
			img_num = tag_arr[0].gsub('img-', "").to_i 
			pic = article_pics[img_num - 1]
			if pic #if pic exists generate fig div html
				url = pic.img.url(:large)
				text.gsub!("<-#{tag}->", "<div class='fig'>
																	<img src='#{url}' alt='pic.caption' width='#{tag_arr[1].strip}'/>
																	<span class='fig-caption'>#{pic.caption}</span>
																	</div>")
			else #else remove tag from text
				text.gsub!("<-#{tag}->", "")
			end
		end
		return text
	end

	def exp_decay(value,elapsed) #value = current value elapsed = elapsed time in seconds
		decay_fraction = elapsed/ARTICLE_LIFETIME	
		return value * (Math.exp(1)**(-decay_fraction))
	end
end
