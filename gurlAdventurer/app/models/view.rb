class View < ActiveRecord::Base
	belongs_to :viewable, polymorphic: true
end
