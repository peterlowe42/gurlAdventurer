class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		
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
			params.require(:article).permit(:title, :body, :author)
		end
end
