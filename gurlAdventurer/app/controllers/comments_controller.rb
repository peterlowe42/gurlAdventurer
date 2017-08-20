class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_Article
	def new
		@comment = Comment.new
	end

	def create
		comment = @article.comments.new(comment_params)
		comment.update(user_id: current_user.id)
		if comment.save
			redirect_to @article
		else
			render 'new'
		end

	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def destroy
		
	end

	private 

	def get_Article
		@article = Article.find(params[:article_id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end
