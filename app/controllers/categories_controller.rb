class CategoriesController < ApplicationController
	include ApplicationHelper
	
	def show
		all_articles = Article.all
		@category = Category.find(params[:id])
		@articles = all_articles.where(category_id: params[:id]).order(created_at: :desc)
		@trending = all_articles.where(category_id: params[:id]).order(popularity: :desc)
		featured = all_articles.where(featured: true).order(created_at: :desc)[0..3] 
		@featured = featured.length > 3 ? featured[0..3] : featured
		@popular = all_articles.order(popularity: :desc)[0..3]
		update_popularity(@category)
	end
end
