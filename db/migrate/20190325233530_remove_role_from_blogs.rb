class RemoveRoleFromBlogs < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :role, :integer
  	remove_column :blogs, :roles, :integer
  end
end
