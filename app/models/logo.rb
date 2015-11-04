class Logo < ActiveRecord::Base
	  has_attached_file :image, 
	  :styles => { large: "640x480>", medium: "320x240"},
      :url => "/tmp/:attachment/:id/:style_:filename"
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
