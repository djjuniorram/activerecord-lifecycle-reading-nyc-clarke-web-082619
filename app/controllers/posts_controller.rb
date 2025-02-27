class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params) 
		redirect_to @post
	  else
		redirect_to edit_post_path
	  end 
	end

	private

	def post_params
		params.require(:post).permit(:title, :description, :post_status, :author_id)
	end
end
