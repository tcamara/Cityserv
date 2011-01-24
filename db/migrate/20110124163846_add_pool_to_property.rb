class AddPoolToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :feat_pool, :string
    add_column :properties, :pp_exp, :string
  end

  def self.down
    remove_column :properties, :feat_pool
    remove_column :properties, :pp_exp
  end
end
