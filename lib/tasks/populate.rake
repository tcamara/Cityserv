namespace :db do
  desc "Erase and Fill "
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Property].each(&:delete_all)

    Property.populate 160 do |property|
      property.mls = 1000000..9999999
      property.reo = 1000000..9999999
      property.esc = 1000000..9999999
      property.occupancy = ['Occupied', 'Vacant']
      property.prop_type = ['House', 'Apartment', 'Condo', 'Split-Level', 'Closet', 'Multi-Family', 'Resale', 'Commercial', 'Farm']
      property.prop_style = ['Ranch', 'Villa', 'Tudor', 'Bungalow', 'Cape Cod', 'Colonial', 'Mobile', 'Duplex']
      property.street_num = 10..9999
      property.street = Faker::Address.street_name
      property.city = Faker::Address.city
      property.state = Faker::Address.us_state_abbr
      property.zip = 10000..99999
      property.floor = 1..3
      #property.unit =
      #property.building =
      property.primary_seller = ['Seller1', 'Seller2', 'Seller3']
      property.status = ['Active', 'Closed', 'Pending']
      property.list_price = 15000..500000
      property.commission = 5000..15000
      property.listing_date = 4.months.ago..1.month.ago
      property.listing_term = [30, 60, 90, 120]
      property.closing_date = Time.now..2.months.from_now
      property.year_built = 1950..2009
      property.prop_id = 1000..9999
      property.last_sold = 1950..2009
      property.area = ['Urban', 'Suburban', 'Rural']
      property.zoning = ['Residential', 'Commercial']
      property.feat_sq_ft = 100..10000
      property.feat_lot_size = 500..4000
      property.feat_floors = 1..3
      property.feat_num_bedrooms = 1..5
      property.feat_num_bathrooms = 1..3
      property.feat_flooring = ['Carpet', 'Linoleum', 'Tile']
      property.feat_heating = ['Central', 'None']
      property.feat_a_c = ['Central', 'None']
      property.feat_fireplace = ['Yes', 'No']
      property.feat_basement = ['Yes', 'No']
      property.feat_parking = 1..3
      property.feat_view = ['Parking Lot', 'Freeway', 'Scenic', 'The Neighbors']
      property.mat_construction = ['Wood', 'Brick']
      property.mat_exterior = ['Stucco', 'Brick', 'Wood-Paneling']
      property.mat_roof = ['Shake', 'Tile', 'Tar']
      property.mat_sewer = ['City', 'Private']
      property.mat_water = ['City', 'On-Site', 'Community']
      property.mat_septic = ['Yes', 'No']
      property.fin_taxes = 5000..100000
      property.fin_tax_year = 1950..2009
      property.fin_tax_assessment = 1000..9000
      property.fin_land_assessment = 1000..9000
      property.fin_tax_roll_num = 100000..999999
      property.fin_building_improvement = 1000..9000
      property.fin_financial = [2.1, 3.4, 3.5, 4.2, 5.5, 6.7]
      property.price_range = 250000..500000
      property.sale_price = 13000..450000
      property.description = Populator.sentences(1..10)
      #property.hoa_name =
      #property.hoa_contact_person =
      #property.hoa_phone =
      #property.hoa_address =
      #property.hoa_monthly_fee =
      #property.hoa_last_payment =
      #property.hoa_payments_due =
      #property.hoa_services_included =
      #property.hoa_supplements =
      #property.hoa_code_violations =
      #property.hoa_sign_complications =
      #property.hoa_gate_code =
      #property.created_at = 2.months.ago..Time.now
      #property.updated_at =2.months.ago..Time.now
    end


    [Contact].each(&:delete_all)

    Contact.populate 110 do |contact|
      contact.first_name = Faker::Name.first_name
      contact.last_name = Faker::Name.last_name
      contact.company_name = Faker::Company.name
      contact.job_title = ['Broker', 'Agent', 'Seller', 'Contractor', 'Field Inspector', 'Realtor', 'Buyer']
      contact.company_address = Faker::Address.street_address()
      contact.home_address = Faker::Address.street_address(false)
      contact.home_phone = Faker::PhoneNumber.phone_number
      contact.cell_phone = Faker::PhoneNumber.phone_number
      contact.work_phone = Faker::PhoneNumber.phone_number
      contact.fax = Faker::PhoneNumber.phone_number
      contact.email = Faker::Internet.email
      contact.preferred_method = ['Email', 'Cell', 'Work', 'Home', 'Fax']
    end


  end
end