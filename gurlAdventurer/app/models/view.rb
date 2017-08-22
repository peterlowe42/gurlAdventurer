class View < ActiveRecord::Base
	belongs_to :viewable, polymorphic: true
	belongs_to :article, primary_key: 'viewable_id'
end
