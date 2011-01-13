class AddSellerNameToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :seller_name, :string
  end

  def self.down
    remove_column :properties, :seller_name
  end
end
