class AddDetailsToAdvertisers < ActiveRecord::Migration
  def change
    add_column :advertisers, :Surname, :string
    add_column :advertisers, :first_name, :string
    add_column :advertisers, :middle_name, :string
    add_column :advertisers, :h_no, :string
    add_column :advertisers, :street, :string
    add_column :advertisers, :area, :string
    add_column :advertisers, :pin_no, :string
    add_column :advertisers, :contact_no, :string
    add_column :advertisers, :tan_no, :string
  end
end
