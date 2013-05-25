class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname, :null => false, :default => ""
      t.string :lastname, :null => false, :default => ""
      t.integer :user_id, :null => false, :default => 0 #set this to :null => false while creating only so that indexing can be done on it
      t.string :mobileno, :null => false, :default => ""
      t.string :email, :null => false, :default => ""
      t.string :password_hash
      t.string :password_salt
      t.string :occupation, :null => false, :default => ""
      t.string :station, :null => false, :default => ""
      t.text :address
      t.string :gender
      t.string :mj_id, :null => false, :default => ""
      t.boolean :reqstatus
      t.boolean :visited, :default => false
      t.float :payment, :default => 0
      t.float :due, :default => 0
      t.integer :family_count, :default => 1
      t.string :photo_file_name # for paperclip
      t.string :photo_content_type # for paperclip
      t.integer :photo_file_size # for paperclip
      t.timestamps
    end
    add_index :users, :user_id, :name => 'index_on_user_id'
  end
end


