class AddLoanNumberToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :loan_number, :string
  end

  def self.down
    remove_column :properties, :loan_number
  end
end
