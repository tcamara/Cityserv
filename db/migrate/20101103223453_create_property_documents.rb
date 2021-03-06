class CreatePropertyDocuments < ActiveRecord::Migration
  def self.up
    create_table :property_documents do |t|
      t.integer :property_id
      t.integer :user_id
      t.string :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :property_documents
  end
end
