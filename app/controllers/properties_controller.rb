class PropertiesController < ApplicationController

  in_place_edit_for :property, :street_num
  in_place_edit_for :property, :mls
  in_place_edit_for :property, :reo
  in_place_edit_for :property, :esc
  in_place_edit_for :property, :occupancy
  in_place_edit_for :property, :prop_type
  in_place_edit_for :property, :prop_style
  in_place_edit_for :property, :street_num
  in_place_edit_for :property, :street
  in_place_edit_for :property, :city
  in_place_edit_for :property, :state
  in_place_edit_for :property, :zip
  in_place_edit_for :property, :floor
  in_place_edit_for :property, :unit
  in_place_edit_for :property, :building
  in_place_edit_for :property, :primary_seller
  in_place_edit_for :property, :status
  in_place_edit_for :property, :list_price
  in_place_edit_for :property, :commission
  in_place_edit_for :property, :listing_date
  in_place_edit_for :property, :listing_term
  in_place_edit_for :property, :closing_date
  in_place_edit_for :property, :year_built
  in_place_edit_for :property, :prop_id
  in_place_edit_for :property, :last_sold
  in_place_edit_for :property, :area
  in_place_edit_for :property, :zoning
  in_place_edit_for :property, :feat_lot_size
  in_place_edit_for :property, :feat_sq_ft
  in_place_edit_for :property, :feat_floors
  in_place_edit_for :property, :feat_num_bedrooms
  in_place_edit_for :property, :feat_num_bathrooms
  in_place_edit_for :property, :feat_flooring
  in_place_edit_for :property, :feat_heating
  in_place_edit_for :property, :feat_a_c
  in_place_edit_for :property, :feat_fireplace
  in_place_edit_for :property, :feat_basement
  in_place_edit_for :property, :feat_parking
  in_place_edit_for :property, :feat_view
  in_place_edit_for :property, :mat_construction
  in_place_edit_for :property, :mat_exterior
  in_place_edit_for :property, :mat_roof
  in_place_edit_for :property, :mat_sewer
  in_place_edit_for :property, :mat_water
  in_place_edit_for :property, :mat_septic
  in_place_edit_for :property, :fin_taxes
  in_place_edit_for :property, :fin_tax_year
  in_place_edit_for :property, :fin_tax_assessment
  in_place_edit_for :property, :fin_land_assessment
  in_place_edit_for :property, :fin_tax_roll_num
  in_place_edit_for :property, :fin_building_improvement
  in_place_edit_for :property, :fin_financial
  in_place_edit_for :property, :price_range
  in_place_edit_for :property, :sale_price
  in_place_edit_for :property, :description
  in_place_edit_for :property, :hoa_name
  in_place_edit_for :property, :hoa_contact_person
  in_place_edit_for :property, :hoa_phone
  in_place_edit_for :property, :hoa_address
  in_place_edit_for :property, :hoa_monthly_fee
  in_place_edit_for :property, :hoa_last_payment
  in_place_edit_for :property, :hoa_payments_due
  in_place_edit_for :property, :hoa_services_included
  in_place_edit_for :property, :hoa_supplements
  in_place_edit_for :property, :hoa_code_violations
  in_place_edit_for :property, :hoa_sign_complications
  in_place_edit_for :property, :hoa_gate_code

  def index
    @recently_updated = Property.find(:all, :order => 'updated_at DESC', :limit => 10)
    @recently_created = Property.find(:all, :order => 'created_at DESC', :limit => 10)

    @active_total = Property.find(:all, :conditions => ['status = ?', 'Active']).count
    @total = Property.count
  end


  def new
    @property = Property.new
  end


  def create
    @property = Property.new(params[:property])
    if @property.save
      flash[:notice] = "Submission Accepted"
      redirect_to properties_path
    else
      flash[:notice] = "Submission Failed"
      render :action => 'new'
    end
  end


  def edit
    @property = Property.find(params[:id])

    respond_to do |format|
      format.html {@property.update_attributes(params[:property])}
      format.js {render :partial => "edit_property", :layout => false}
      format.json { render :json => @property }
    end
  end


  def show
    @property = Property.find(params[:id])
  end


  def list
    sort = Property.parse_it(params['sort'])
    @sorted_properties = Property.paginate :page => params[:page], :order => sort

    if request.xml_http_request?
      render :partial => "property_list", :layout => false
    end
  end


  def search
    @query = params[:q]
    @results = Property.search(@query)
    sort = Property.parse_it(params['sort'])
    @sorted_properties = Property.paginate :conditions => ["street_num LIKE ? or street LIKE ? or city LIKE ? or state LIKE ? or zip LIKE ? or status LIKE ? or primary_seller LIKE ? or list_price LIKE ? or listing_date LIKE ? or closing_date LIKE ? or mls LIKE ? or reo LIKE ? or esc LIKE ?", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%"], :page => params[:page], :order => sort
  end


  def update
    @property = Property.find(params[:id])

    if params[:type] == 'doc'
      @property.property_documents.create(params[:property])
      redirect_to :controller => 'properties', :action => 'documents', :id => @property
    else
      @property.property_photos.create(params[:property])
      redirect_to :controller => 'properties', :action => 'photos', :id => @property
    end

    
  end


  def contacts
    @property = Property.find(params[:id])
    @sorted_contacts = @property.contacts
  end


  def photos
    @property = Property.find(params[:id])
    @property_photos = @property.property_photos
  end

  
  def documents
    @property = Property.find(params[:id])
    @property_documents = @property.property_documents
  end

end
