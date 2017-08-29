class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :article, primary_key: 'commentable_id'
	belongs_to :comment, primary_key: 'commentable_id'
	belongs_to :user, primary_key: 'user_id'
	has_many :comments, as: :commentable 
end

