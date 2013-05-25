class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.integer :user_id, :null => false, :default => 0 # set this to :null => false while creating only so that indexing can be done on it
      t.integer :family_member_user_id, :null => false, :default => 0 # set this to :null => false so that indexing can be done
      t.boolean :join_pending, :default => true
      t.float :payment_status, :default => false
      t.integer :relation_id, :integer, :null => false, :default => 0
      t.timestamps
    end
    add_index :family_members, :user_id, :name => 'user_id_index'
    add_index :family_members, :family_member_user_id, :name => 'index_on_fmuid'
  end
end
