class Logo < ActiveRecord::Base
	  has_attached_file :image, 
	  :styles => { large: "640x480>", medium: "320x240"},
	  :storage => :s3, 
      # :bucket => ENV['S3_BUCKET_NAME'],	
      :bucket => 'logoit2',
      :s3_credentials => { 
      	# :access_key_id => ENV['AWS_ACCESS_KEY_ID'], 
      	# :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] 
      	:access_key_id => 'AKIAJIYXPJN66YDD6LFA', 
      	:secret_access_key => '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' 
      }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	  belongs_to :campaign
	  belongs_to :user
end
