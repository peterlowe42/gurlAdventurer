class Picture < ActiveRecord::Base
	attr_accessor :article_id
	belongs_to :article

	has_attached_file :img, styles: {large: "900x675>", medium: "300x225>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
