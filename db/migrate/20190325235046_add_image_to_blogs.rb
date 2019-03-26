class AddImageToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :main_image, :string
    add_column :blogs, :thumb_image, :string
  end
end
