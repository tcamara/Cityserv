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
    @type = params[:type]
  end


  def create
    @contact = Contact.new(params[:contact])
    if params[:pid] != ''
      @contact.save
      redirect_to new_associated_path({:pid => params[:pid], :ctype => params[:type], :cid => @contact.id})
    else
      if @contact.save
        flash[:notice] = "Submission Accepted"
        redirect_to contacts_path
      else
        flash[:notice] = "Submission Failed"
        render :action => 'new'
      end
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
    @notes = Note.find_all_by_contact_id(@contact.id)
  end


  def search
    @query = params[:q]
    @results = Contact.search(@query)
    sort = Contact.parse_it(params['sort'])
    @sorted_contacts = Contact.paginate :conditions => ["first_name LIKE ? or last_name LIKE ? or category LIKE ? or job_title LIKE ? or company_name LIKE ?", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%"], :page => params[:page], :order => sort
  end


  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(params[:contact])

    respond_to do |format|
      format.html {@contact.update_attributes(params[:contact])}
      format.json { render :json => @contact }
    end
  end

  
  in_place_edit_for :contact, :street_num
  in_place_edit_for :contact, :first_name
  in_place_edit_for :contact, :last_name
  in_place_edit_for :contact, :category
  in_place_edit_for :contact, :company_name
  in_place_edit_for :contact, :job_title
  in_place_edit_for :contact, :company_address
  in_place_edit_for :contact, :home_address
  in_place_edit_for :contact, :home_phone
  in_place_edit_for :contact, :work_phone
  in_place_edit_for :contact, :cell_phone
  in_place_edit_for :contact, :fax
  in_place_edit_for :contact, :email
  in_place_edit_for :contact, :preferred_method

  
end
