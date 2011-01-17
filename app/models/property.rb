class Property < ActiveRecord::Base

  validates_presence_of :street_num, :street, :city, :state, :zip, :primary_seller

  has_many :comments
  has_many :property_photos
  has_many :property_documents
  has_many :associateds
  has_many :contacts, :through => :associateds

  has_many :city_contacts, :through => :associateds, :source => :contact, :conditions => "ctype = 'City'"
  has_many :servicer_contacts, :through => :associateds, :source => :contact, :conditions => "ctype = 'servicer'"
  has_many :owner_contacts, :through => :associateds, :source => :contact, :conditions => "ctype = 'owner'"
  has_many :noteholder_contacts, :through => :associateds, :source => :contact, :conditions => "ctype = 'noteholder'"
  has_many :preservation_company_contacts, :through => :associateds, :source => :contact, :conditions => "ctype = 'preservation_company'"
  has_many :other_contacts, :through => :associateds, :source => :contact, :conditions => "ctype = 'other'"
  
  cattr_reader :per_page
  @@per_page = 50

  def self.search(query)
    if query && query != "" && query != " "
      find(:all, :conditions => ["street_num LIKE ? or street LIKE ? or city LIKE ? or state LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"], :order => 'street_num')
    end
  end

  def self.parse_it(parameter)
    sort = case parameter
             when "address"  then "street"
             when "status"   then "status"
             when "seller" then "primary_seller"
             when "street_num" then "street_num"
             when "direction" then "direction"
             when "city" then "city"
             when "state" then "state"
             when "zip_code" then "zip"
             when "list_price" then "list_price"
             when "listing_date" then "listing_date"
             when "closing_date" then "closing_date"
             when "occupancy" then "occupancy"
             when "reo" then "reo"
             when "esc" then "esc"
             when "address_reverse"  then "street DESC"
             when "status_reverse"   then "status DESC"
             when "seller_reverse" then "primary_seller DESC"
             when "street_num_reverse" then "street_num DESC"
             when "direction_reverse" then "direction DESC"
             when "city_reverse" then "city DESC"
             when "state_reverse" then "state DESC"
             when "zip_code_reverse" then "zip DESC"
             when "list_price_reverse" then "list_price DESC"
             when "listing_date_reverse" then "listing_date DESC"
             when "closing_date_reverse" then "closing_date DESC"
             when "occupancy_reverse" then "occupancy DESC"
             when "reo_reverse" then "reo DESC"
             when "esc_reverse" then "esc DESC"
    end
  end

end
