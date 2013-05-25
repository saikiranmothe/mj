class AddDobToUsers < ActiveRecord::Migration
  def change
  	add_column	:users, :dob, :string, :null => false, :default => ""
  end
end
