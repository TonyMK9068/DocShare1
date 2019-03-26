class RemoveRolesFromBlog < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :role_id, :integer
  end
end
