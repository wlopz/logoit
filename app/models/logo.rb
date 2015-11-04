class Logo < ActiveRecord::Base
	  has_attached_file :image, :styles => { large: "640x480>", medium: "320x240"}
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
