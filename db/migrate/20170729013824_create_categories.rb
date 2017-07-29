class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_category_id
      t.string :slug

      t.timestamps
    end
  end
end
