class PostsController < ApplicationController
	#before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :correct_user, only: [:edit, :update, :destroy]

	def index
		@post = Post.all
	end

	def new 
		#@post = Post.new
		@post = current_user.posts.build
	end

	def create
		#@post = Post.new(post_params)
		
		@post = current_user.posts.build(post_params)
		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	def correct_user
		@post = current_user.posts.find_by(id: params[:id])
		redirect_to posts_path, notice: "Not Authorized to Edit this" if @post.nil?
	end

	#private
		#def set_post
			#@post = Post.find(params[:id])
		#end

	private
		def post_params
			params.require(:post).permit(:title, :body, :user_id)	        
		end

end
