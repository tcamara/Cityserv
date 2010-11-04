class PropertyDocument < ActiveRecord::Base

  belongs_to :property

  has_attached_file :document

  validates_attachment_presence :document
  validates_attachment_content_type :document, :content_type => [ 'application/pdf', 'application/msword', 'application/vnd.ms-excel', 'applicationapplication/vnd.ms-outlook', 'application/vnd.ms-powerpoint', 'image/jpeg', 'text/plain', 'text/richtext' ]
  validates_attachment_size :document, :less_than => 6.megabytes

end