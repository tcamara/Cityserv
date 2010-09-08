class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :property

  validates_presence_of :text

  def self.order(property, type, order)
    if type != 'All'
      property.comments.find(:all, :conditions => [ "level = ?", type ], :order => "updated_at " << order)
    else
      property.comments.find(:all, :order => "updated_at " << order)
    end
  end

end
