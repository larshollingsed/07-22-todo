class AddItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.text :content
      t.integer :user_id
      t.timestamps
    end
    
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :password
      t.timestamps
    end
  end
end
