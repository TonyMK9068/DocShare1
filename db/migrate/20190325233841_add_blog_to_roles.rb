class AddBlogToRoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :blog, foreign_key: true
  end
end
