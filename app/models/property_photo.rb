class PropertyPhoto < ActiveRecord::Base

  belongs_to :property

  has_attached_file :photo, :styles => { :thumb => '100x100>' }

  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png' ]
  validates_attachment_size :photo, :less_than => 1.megabytes

end
