class CommentsController < ApplicationController
  def index
    @property = Property.find(params[:property_id])
    @type = params[:type] || 'All'
    @order = params[:order] || 'DESC'
    @comments = Comment.order(@property, @type, @order)
    @categories = [@current_user.level, "Accounting", "Code Violations", "Escrow", "NAWRB", "Offers", "Property Management", "Relocations", "Repairs", "Utilities"].uniq
    #@categories = @categories.uniq
  end


  def create
    @property = Property.find(params[:property_id])
    @comment = @property.comments.create(params[:comment])
  end

  
  def destroy
    @comment = Comment.destroy(params[:id])
    @property = Property.find(params[:property_id])
    @comments = Comment.order(@property, 'All', 'DESC')
    redirect_to contacts_property_path(@property)
  end


end
