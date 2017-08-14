class Article < ActiveRecord::Base
	acts_as_taggable
	has_many :comments 

	has_attached_file :image, styles: {large: "600x450#", medium: "300x225#", thumb: "150x112#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
