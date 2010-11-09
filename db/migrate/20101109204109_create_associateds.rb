class CreateAssociateds < ActiveRecord::Migration
  def self.up
    create_table :associateds do |t|
      t.integer :property_id
      t.integer :contact_id
      t.string :ctype

      t.timestamps
    end
  end

  def self.down
    drop_table :associateds
  end
end
