class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string :mls
      t.integer :reo
      t.integer :esc
      t.string :occupancy
      t.string :prop_type
      t.string :prop_style
      t.integer :street_num
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :floor
      t.string :unit
      t.string :building
      t.string :primary_seller
      t.string :status
      t.integer :list_price
      t.integer :commission
      t.datetime :listing_date
      t.string :listing_term
      t.datetime :closing_date
      t.integer :year_built
      t.string :prop_id
      t.datetime :last_sold
      t.string :area
      t.string :zoning
      t.string :feat_lot_size
      t.string :feat_sq_ft
      t.integer :feat_floors
      t.integer :feat_num_bedrooms
      t.integer :feat_num_bathrooms
      t.string :feat_flooring
      t.string :feat_heating
      t.string :feat_a_c
      t.string :feat_fireplace
      t.string :feat_basement
      t.string :feat_parking
      t.string :feat_view
      t.string :mat_construction
      t.string :mat_exterior
      t.string :mat_roof
      t.string :mat_sewer
      t.string :mat_water
      t.string :mat_septic
      t.integer :fin_taxes
      t.integer :fin_tax_year
      t.integer :fin_tax_assessment
      t.integer :fin_land_assessment
      t.string :fin_tax_roll_num
      t.integer :fin_building_improvement
      t.string :fin_financial
      t.string :price_range
      t.integer :sale_price
      t.text :description
      t.string :hoa_name
      t.string :hoa_contact_person
      t.string :hoa_phone
      t.string :hoa_address
      t.integer :hoa_monthly_fee
      t.datetime :hoa_last_payment
      t.integer :hoa_payments_due
      t.string :hoa_services_included
      t.string :hoa_supplements
      t.string :hoa_code_violations
      t.string :hoa_sign_complications
      t.string :hoa_gate_code
      t.string :lockbox
      t.integer :purchase_price

      t.timestamps
    end

    create_table :contacts_properties, :id => false do |t|
      t.integer :contact_id
      t.integer :property_id
    end

    add_index :contacts_properties, [:contact_id, :property_id], :unique => true
    add_index :contacts_properties, :property_id, :unique => false
  end

  def self.down
    drop_table :properties
    drop_table :contacts_properties
  end
end
