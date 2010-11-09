class AssociatedsController < ApplicationController

  def new
    assoc = Associated.new
    assoc.property_id = params[:pid]
    assoc.contact_id = params[:cid]
    assoc.ctype = params[:ctype]
    assoc.save

    redirect_to properties_path
  end


end
