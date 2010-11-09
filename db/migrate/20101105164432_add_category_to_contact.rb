class AddCategoryToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :category, :string
  end

  def self.down
    remove_column :contacts, :category
  end
end
