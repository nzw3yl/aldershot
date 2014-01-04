class CreateStucks < ActiveRecord::Migration
  def change
    create_table :stucks do |t|
      t.string :content
      t.integer :user_id
      t.integer :owner_id
      t.boolean :complete, :default => false

      t.timestamps
    end   
    add_index :stucks, :owner_id
  end
end
