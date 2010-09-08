class ContactsController < ApplicationController
  def index
    sort = Contact.parse_it(params['sort'])
    @sorted_contacts = Contact.paginate :page => params[:page], :order => sort

    if request.xml_http_request?
      render :partial => "contact_list", :layout => false
    end
  end


  def new
    @contact = Contact.new
    @pid = params[:pid]
  end


  def create
    @contact = Contact.new(params[:contact])
    Property.find(@pid).contacts.push(@contact)
    if @contact.save
      flash[:notice] = "Submission Accepted"
      redirect_to contacts_path
    else
      flash[:notice] = "Submission Failed"
      render :action => 'new'
    end
  end


  def edit
    @contact = Contact.find(params[:id])

    if request.post?
      @contact.update_attributes(params[:contact])
      redirect_to :action => 'edit', :id => @contact.id
    end
  end


  def show
    @contact = Contact.find(params[:id])
  end


  def search
    @query = params[:q]
    @results = Contact.search(@query)
    sort = Contact.parse_it(params['sort'])
    @sorted_contacts = Contact.paginate :conditions => ["first_name LIKE ? or last_name LIKE ? or job_title LIKE ? or company_name LIKE ?", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%"], :page => params[:page], :order => sort
  end


  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(params[:contact])

    respond_to do |format|
      format.html {@contact.update_attributes(params[:contact])}
      format.json { render :json => @contact }
    end
  end

  
end
