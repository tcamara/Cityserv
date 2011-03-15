class AddTgnoToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :tgno, :string
    add_column :properties, :first_look, :string
  end

  def self.down
    remove_column :properties, :first_look
    remove_column :properties, :tgno
  end
end
