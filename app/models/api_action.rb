class ApiAction < Logo

	def destoy_logoO(uuid_item)
		response = Unirest.delete"https://my.craftar.net/api/v0/item/#{uuid_item}/?api_key=edc7de4e6ead658c275e09924669f23020c84469",
	    headers:{"Content-Type" => "application/json"}
	end

	def create_item(name,url)
	  	response = Unirest.post'https://my.craftar.net/api/v0/item/?api_key=edc7de4e6ead658c275e09924669f23020c84469', 
	        headers:{ 
	        	"Content-Type" => "application/json" 
	        }, 
	        parameters: { 
	            "collection" => "/api/v0/collection/f749848ef11d434c8894004bcef80229/",
	       		"name" => "#{name}",
	        	"url" => "#{url}" 
	        }.to_json
    	@uuid_item = response.body["uuid"]
    	# pp response
    	return @uuid_item
	end

	def create_image(image_location,uuid)
	  	response = Unirest.post'https://my.craftar.net/api/v0/image/?api_key=edc7de4e6ead658c275e09924669f23020c84469',
	        parameters: {
	            'item' => "/api/v0/item/#{uuid}/",
	       		'file' => File.open(image_location)
	        }
	    # pp response
	end
end