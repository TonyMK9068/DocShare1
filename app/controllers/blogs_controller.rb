class BlogsController < ApplicationController

	def index
		Blog.where(public: true)
	end

	def new
		@blog = Blog.new
	end

	def create
		@role = current_user.roles.build(description: "owner")
		@blog = @role.build(params[:blog])

		if @blog.save
			flash[:notice] = 'Blog created successfully.'
			redirect_to @blogs_path
		else
			flash[:error] = 'Error saving page. Try again.'
			render :new
		end
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])

		if @blog.update_attributes(params[:blog])
			flash[:notice] = 'Blog updated successfully.'
			redirect_to edit_blog_path(@blog)
		else
			flash[:error] = 'Error updating. Try again.'
			render :index
		end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def destroy
		@blog = Blog.find(params[:id])

		if @blog.destroy
			flash[:notice] = 'Blog successfully deleted.'
			redirect_to blogs_path
		else
			flash[:error] = 'Error deleting blog. Try again.'
			render :index
		end
	end
end