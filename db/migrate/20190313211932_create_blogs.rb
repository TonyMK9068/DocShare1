class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.references :role, foreign_key: true
      t.boolean :private

      t.timestamps
    end
  end
end
