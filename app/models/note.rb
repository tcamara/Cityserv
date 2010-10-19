class Note < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact

  validates_presence_of :text, :user_id, :contact_id
  
end
