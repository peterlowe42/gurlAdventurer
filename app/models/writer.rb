class Writer < ActiveRecord::Base
	has_many :articles

	has_attached_file :avatar, styles: { medium: "300x225#", thumb: "150x112#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates_attachment_presence :avatar

	validates :firstname, presence: true
	validates :lastname, presence: true
end
