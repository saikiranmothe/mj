class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :ad_file_name
      t.string :ad_content_type
      t.integer :ad_file_size

      t.timestamps
    end
  end
end
