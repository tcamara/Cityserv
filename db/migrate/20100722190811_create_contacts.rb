class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts, :force => true do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :job_title
      t.string :company_address
      t.string :home_address
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.string :fax
      t.string :email
      t.string :preferred_method

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
