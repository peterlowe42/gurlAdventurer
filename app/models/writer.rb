class Writer < ActiveRecord::Base
	before_create :build_full_name
	has_many :articles

	has_attached_file :avatar, styles: { medium: "300x225#", thumb: "150x112#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates_attachment_presence :avatar

	validates :first_name, presence: true
	validates :last_name, presence: true

	private 

	def build_full_name
		if self.middle_initial
			self.fullname = self.first_name + " " + self.middle_initital + " " + self.last_name
		else
			self.fullname = self.first_name  + " " + self.last_name
		end
	end
end
