class ArticlesController < ApplicationController
	include ArticlesHelper
	before_filter :log_view, only: [:show]

	def index
		@articles = Article.all.order("created_at desc").to_a

		@featured = Article.where(featured: true).order("created_at desc")[0..2] 

		@trending = Article.order(popularity: :desc)[0..3]
	end

	def show
		@article = Article.find(params[:id])
		@content = process_text(@article)
		@related_articles = @article.find_related_tags[0,3]
		@comments = Comment.where(commentable_id: @article.id, commentable_type: 'Article')
		update_populatity(@article)
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

		def update_populatity(article)
			article_time = article.last_decay ? article.last_decay : article.created_at
			time_elapsed = Time.now.utc - article_time 
			article.popularity = exp_decay(article.popularity, time_elapsed) + 1
			article.last_decay = Time.now.utc
			article.save
		end

		def log_view
			@article = Article.find(params[:id])
			user_id = user_signed_in? ? current_user.id : nil 
			@article.views.create(ip_address: request.remote_ip, user_id: user_id)
		end
end
