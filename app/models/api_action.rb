class ApiAction < Logo

  	def create_logo(name,url,image_location)
		create_item(name,url)
		sleep(2)
		create_image(image_location,@uuid_item)
	end

	def destoy_logoO(uuid_item)
		response = Unirest.delete"https://my.craftar.net/api/v0/item/#{uuid_item}/?api_key=7fd139eb9ac68aad6f63dfb5fa12fb9f4ecf7a47",
	    headers:{"Content-Type" => "application/json"}
	end

	private

	def create_item(name,url)
	  	response = Unirest.post'https://my.craftar.net/api/v0/item/?api_key=7fd139eb9ac68aad6f63dfb5fa12fb9f4ecf7a47', 
	        headers:{ 
	        	"Content-Type" => "application/json" 
	        }, 
	        parameters: { 
	            "collection" => "/api/v0/collection/b94d706600184f498033c1259c4e8940/",
	       		"name" => "#{name}",
	        	"url" => "#{url}" 
	        }.to_json
    	@uuid_item = response.body["uuid"]
	end

	def create_image(image_location,uuid)
	  	response = Unirest.post'https://my.craftar.net/api/v0/image/?api_key=7fd139eb9ac68aad6f63dfb5fa12fb9f4ecf7a47',
	        parameters: {
	            'item' => "/api/v0/item/#{uuid}/",
	       		'file' => File.open(image_location)
	        }
	    pp response
	end
end