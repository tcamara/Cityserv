class AddMmrToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :mmr, :string
  end

  def self.down
    remove_column :properties, :mmr
  end
end
