class PropertiesController < ApplicationController

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
    @property.update_attributes(params[:property])

    respond_to do |format|
      format.html {@property.update_attributes(params[:property])}
      format.js {render :partial => "edit_property", :layout => false}
      format.json { render :json => @property }
    end
  end

  def contacts
    @property = Property.find(params[:id])
    @sorted_contacts = @property.contacts
  end

end
