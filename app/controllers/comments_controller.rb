class CommentsController < ApplicationController
  def index
    @property = Property.find(params[:property_id])
    @type = params[:type] || 'All'
    @order = params[:order] || 'DESC'
    @comments = Comment.order(@property, @type, @order)
  end


  def create
    @property = Property.find(params[:property_id])
    @comment = @property.comments.create(params[:comment])
  end

  
  def destroy
    @comment = Comment.destroy(params[:id])
    @comments = Comment.find_all_by_property_id(params[:property_id])
    redirect_to contacts_property_path(@property)
  end


end
