class Associated < ActiveRecord::Base

  belongs_to :property
  belongs_to :contact

end
