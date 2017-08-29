class CategoriesController < ApplicationController
	include ApplicationHelper
	
	def show
		@category = Category.find(params[:id])
		@articles = Article.where(category_id: params[:id]).order(created_at: :desc)
		@trending = Article.where(category_id: params[:id]).order(popularity: :desc)
		featured = Article.where(featured: true).order(created_at: :desc)[0..3] 
		@featured = featured.length > 3 ? featured[0..3] : featured
		@popular = Article.order(popularity: :desc)[0..3]
		update_popularity(@category)
	end
end
