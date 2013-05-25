class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :relationship
      t.integer :priority, :integer, :null => false, :default => 0
      t.timestamps
    end
  end
end
