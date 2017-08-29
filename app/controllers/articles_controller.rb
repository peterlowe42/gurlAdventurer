class ArticlesController < ApplicationController
	include ArticlesHelper
	include ApplicationHelper

	before_filter :log_view, only: [:show]
	before_action :confirm_admin, only: [:new, :edit, :update, :create]

	def index
		@latest = Article.paginate(:page => params[:page], :per_page => 5)
		if @latest.length > 0 
			popCatecories = Category.order(popularity: :desc)[0..1]
			catOneArticles = Article.where(category_id: popCatecories[0]).order(created_at: :desc)
			catTwoArticles = Article.where(category_id: popCatecories[1]).order(created_at: :desc)
			@category_hash = { popCatecories[0].title => catOneArticles,
												 popCatecories[1].title => catTwoArticles }
			if !params[:page] || params[:page] == '1'
				@featured = Article.where(featured: true).order(created_at: :desc)[0..2] 
				@trending = Article.order(popularity: :desc)[0..5]
			end
		else
			render 'no_articles'
		end
	end

	def show
		@article = Article.find(params[:id])
		@content = process_text(@article)
		@related_articles = @article.find_related_tags[0,3]
		@comments = Comment.where(commentable_id: @article.id, commentable_type: 'Article')
		category = Category.where(id: @article.category_id).to_a[0]
		update_popularity(category)
		update_popularity(@article)
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(params_article)
		if @article.save
			redirect_to @article
		else
			redirect_to new_article_path
		end
	end

	def update
	end

	def destroy
	end

	private

		def params_article
			params.require(:article).permit(:title, :body, :author, :image, :tag_list, :feature)
		end

		def log_view
			@article = Article.find(params[:id])
			user_id = user_signed_in? ? current_user.id : nil 
			@article.views.create(ip_address: request.remote_ip, user_id: user_id)
		end

		def confirm_admin
			redirect_to root_path unless user_signed_in? && current_user.admin == true
		end
end
