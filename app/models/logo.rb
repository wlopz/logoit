class Logo < ActiveRecord::Base
	  has_attached_file :image, 
	  :styles => { large: "640x480>", medium: "320x240"},
	  :storage => :s3, 
      :bucket => "logoit2",
      :s3_credentials => { 
      	:access_key_id => "AKIAILZYGVGH5DJJCTDQ", 
      	:secret_access_key => "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" 
      }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	  belongs_to :campaign
	  belongs_to :user
end
