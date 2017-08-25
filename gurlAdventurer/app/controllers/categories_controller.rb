class CategoriesController < ApplicationController
	include ApplicationHelper
	
	def show
		@category = Category.find(params[:id])
		@articles = Article.where(category_id: params[:id])
		update_popularity(@category)
	end
end
