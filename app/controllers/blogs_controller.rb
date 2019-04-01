class BlogsController < ApplicationController

	def index
		@blogs = Blog.public_blogs.last(5)
	end

	def new
		@blog = Blog.new
		
	end

	def create
		@blog = Blog.new(blog_params)

		if @blog.save
			role = @blog.roles.build(user_id: current_user.id, description: "owner")
			role.save
			flash[:notice] = 'Blog created successfully.'
			redirect_to blog_path(@blog)
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

	private

	def blog_params
		params.require(:blog).permit(:id,
																 :title,
																 :body,
																 :private,
																 :main_image,
																 :thumb_image,
																 :role_attributes => [:id, 
																 											:description, 
																 											:user_id]
																)
	end

end