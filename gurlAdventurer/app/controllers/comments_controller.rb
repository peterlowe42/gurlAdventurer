class CommentsController < ApplicationController
	before_action :get_Article
	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to article_path(@article)
		else 
			render new
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
		params.require(:comment).permit(:body, :user_id)
	end
end
