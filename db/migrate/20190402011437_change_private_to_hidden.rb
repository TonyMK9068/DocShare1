class ChangePrivateToHidden < ActiveRecord::Migration[5.2]
  def change
    rename_column :blogs, :private, :hidden
  end
end
