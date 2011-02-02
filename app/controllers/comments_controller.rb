class CommentsController < ApplicationController
  def index
    @property = Property.find(params[:property_id])
    @type = params[:type] || 'All'
    @order = params[:order] || 'DESC'
    @comments = Comment.order(@property, @type, @order)
    @categories = [@current_user.level, "Accounting", "BPO", "Code Violations", "Escrow", "Listings", "NAWRB", "Offers", "Property Management", "Relocations", "Repairs", "Utilities"].uniq
    
    @hc_escrow = @property.escrow_contacts.find(:first)
    @hc_selling_agent = @property.selling_agent_contacts.find(:first)
    @hc_capital_bid = @property.capital_bid_contacts.find(:first)
    @hc_lender = @property.lender_contacts.find(:first)
  end


  def create
    @property = Property.find(params[:property_id])
    @comment = @property.comments.create(params[:comment])
  end

  
  def destroy
    @comment = Comment.destroy(params[:id])
    @property = Property.find(params[:property_id])
    @comments = Comment.order(@property, 'All', 'DESC')
    redirect_to property_comments_path(@property)
  end


end
