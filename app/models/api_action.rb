class ApiAction
	attr_accessor :uuid_item, :uuid_image

	def create_campaign(name,url)
	  	response = Unirest.post'https://my.craftar.net/api/v0/item/?api_key=edc7de4e6ead658c275e09924669f23020c84469', 
	        headers:{ 
	        	"Content-Type" => "application/json" 
	        }, 
	        parameters: { 
	            "collection" => "/api/v0/collection/06995029612e4377aa078b60af233972/",
	       		"name" => "#{name}",
	        	"url" => "#{url}" 
	        }.to_json
    	@uuid_item = response.body["uuid"]
    	
    	return @uuid_item
	end

	def destroy_campaign(uuid_item)
  		response = Unirest.delete"https://my.craftar.net/api/v0/item/#{uuid_item}/?api_key=edc7de4e6ead658c275e09924669f23020c84469",
	    	headers:{"Content-Type" => "application/json"}
	    p "********response: #{response.inspect}********"
	    p "********uuido item: #{uuid_item}********"
	end

	def update_campaign(uuid_item,name,url)
		 response = Unirest.put"https://my.craftar.net/api/v0/item/#{uuid_item}/?api_key=edc7de4e6ead658c275e09924669f23020c84469",
		 	headers:{"Content-Type" => "application/json"},
		 	parameters:{
		 		"name": "#{name}",
         		"url": "#{url}" 
		 	}.to_json

		p "********response: #{response.inspect}********"
	end

	def create_image(uuid,image_location)
	  	response = Unirest.post'https://my.craftar.net/api/v0/image/?api_key=edc7de4e6ead658c275e09924669f23020c84469',
	        parameters: {
	            'item' => "/api/v0/item/#{uuid}/",
	       		'file' => File.open(image_location)
	        }
	    @uuid_image = response.body["uuid"]
	    return uuid_image = response.body["uuid"]
	end

	def destroy_image(uuid_image)
		response = Unirest.delete"https://my.craftar.net/api/v0/image/#{uuid_image}/?api_key=edc7de4e6ead658c275e09924669f23020c84469",
	    headers:{"Content-Type" => "application/json"}
	end
end





