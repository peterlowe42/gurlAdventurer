class ArticlesController < ApplicationController
	def index
		@articles = Article.all.order("created_at desc").to_a

		@feature = Article.where(featured: true).order("created_at desc")[0] 

		@articles.reject! { |article| article == @feature }
	end

	def show
		@article = Article.find(params[:id])
		@related_articles = @article.find_related_tags[0,3]
	end

	def new

	end

	def edit
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
end
