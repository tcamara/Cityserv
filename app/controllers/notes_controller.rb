class NotesController < ApplicationController

  def index
    @contact = Contact.find(params[:contact_id])
    @notes = Note.find_all_by_contact_id(params[:contact_id])
  end


  def create
    @contact = Contact.find(params[:contact_id])
    @note = @contact.notes.create(params[:note])
  end


  def destroy
    @note = Note.destroy(params[:id])
    @notes = Note.find_all_by_contact_id(params[:contact_id])
    redirect_to contact_path(params[:contact_id])
  end

end
