class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :details
      t.integer :user_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
