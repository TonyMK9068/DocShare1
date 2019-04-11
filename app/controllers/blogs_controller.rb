class BlogsController < ApplicationController

	def index
		@blogs = Blog.public_blogs.last(5)
	end

	def new
		@blog = Blog.new
		
	end

	def create
		@blog = Blog.new(blog_params)

		respond_to do |format|
			if @blog.save
				role = @blog.roles.build(user_id: current_user.id, description: "owner")
				role.save
			
				format.html { redirect_to @blog, notice: 'Blog created successfully.' }
			else
				format.html { render :new,  error: 'Error saving page. Try again.' }
				
			end
		end
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		respond_to do |format|
			if @blog.update_attributes(params[:blog])
				format.html { redirect_to @blog, notice: 'Blog updated successfully.' }
			else
				format.html { render :edit, error: 'Error updating. Try again.' }
				
			end
		end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def destroy
		@blog = Blog.find(params[:id])

		respond_to do |format|
			if @blog.destroy
				format.html { redirect_to blogs_path, notice: 'Blog successfully deleted.' }
				
			else
				format.html { render :edit, error: 'Error deleting blog. Try again.' }
			end
		end
	end

	private

	def blog_params
		params.require(:blog).permit(:id,
																 :title,
																 :body,
																 :hidden,
																 :main_image,
																 :thumb_image,
																 :role_attributes => [:id, 
																 											:description, 
																 											:user_id]
																)
	end

end