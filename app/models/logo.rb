class Logo < ActiveRecord::Base
	  has_attached_file :image, 
	  :styles => { large: "640x480>", medium: "320x240"},
	  :storage => :s3, 
      :bucket => ENV['S3_BUCKET_NAME'],
      :s3_credentials => { 
      	:access_key_id => ENV['AWS_ACCESS_KEY_ID'], 
      	:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] 
      }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
