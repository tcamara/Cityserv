class AddEmailHeaderToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :email_header, :string
  end

  def self.down
    remove_column :properties, :email_header
  end
end
