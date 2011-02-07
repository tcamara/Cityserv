class AssociatedsController < ApplicationController

  def new
    assoc = Associated.new
    assoc.property_id = params[:pid]
    assoc.ctype = params[:ctype]
    
    if !params[:cid].blank?
      assoc.contact_id = params[:cid]
      
    elsif !params[:name].blank?
      temp = params[:name].split(" ")
      if temp.length != 2
        @query = temp[0]
        assoc.contact_id = Contact.find(:first, :conditions => ["first_name LIKE ? or last_name LIKE ? or job_title LIKE ? or company_name LIKE ?", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%"]).id
      else
        assoc.contact_id = Contact.find_by_first_name_and_last_name(temp[0], temp[1]).id
      end 
    else
      assoc.delete
      return
    end
    
    assc = Associated.find_all_by_contact_id_and_property_id(assoc.contact_id, assoc.property_id) 
    
    if assc.nil?
      assoc.save
    
    else
      exists = false
      assc.each do |i|
        exists = true if i.ctype == assoc.ctype
      end
      if !exists
        assoc.save
      end
    
    end
        
    redirect_to contacts_property_path(assoc.property_id)
  end

  def destroy
    @assoc = Associated.find(:first, :conditions => ["contact_id = ? and property_id = ? and ctype = ?", params[:cid], params[:pid], params[:ctype]])
    @assoc.delete
    
    redirect_to :back
    
  end
  

end
