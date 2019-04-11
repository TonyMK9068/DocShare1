class AddDefaultValueToHidden < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :hidden, :boolean, default: false
  end
end
