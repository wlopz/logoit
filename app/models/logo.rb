class Logo < ActiveRecord::Base
	  has_attached_file :image, 
	  :styles => { large: "640x480>", medium: "320x240"},
	  :storage => :s3, 
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :path => "logoit/:attachment/:style/:id.:extension"
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
