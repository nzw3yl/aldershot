class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :content
      t.integer :user_id
      t.boolean :high, :default => true
      t.boolean :complete, :default => false

      t.timestamps
    end
  end
end
