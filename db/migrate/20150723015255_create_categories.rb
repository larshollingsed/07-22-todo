class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :name
      t.integer :user_id
    end
    
    add_column :items, :category_id, :integer
  end
end
