class AddFieldsToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :direction, :string
    add_column :properties, :terms, :string
    add_column :properties, :showing_instructions, :string
  end

  def self.down
    remove_column :properties, :direction
    remove_column :properties, :terms
    remove_column :properties, :showing_instructions
  end
end
