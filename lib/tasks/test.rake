namespace :test do
  desc "TODO"
  task api: :environment do
  	response = Unirest.post 'https://my.craftar.net/api/v0/item/?api_key=7fd139eb9ac68aad6f63dfb5fa12fb9f4ecf7a47', 
        headers:{
         	"Content-Type" => "application/json"
         }, 
        parameters: { 
        	"collection" => "/api/v0/collection/b94d706600184f498033c1259c4e8940/",
       		"name" => "Wyncode",
        	"url" => "http://www.wyncode.co" 
        }.to_json

    pp response.body["uuid"]
  end

  task create_image: :environment do
  	response = Unirest.post'https://my.craftar.net/api/v0/image/?api_key=7fd139eb9ac68aad6f63dfb5fa12fb9f4ecf7a47', 
        parameters: {
            'item' => '/api/v0/item/a6c7feea152e4281ba81bc7a0a213a2a/',
       		'file' => File.open("./public/system/logos/images/000/000/004/large/Wyncode-color_logo.png")
        }
    pp response.body["uuid"]
  end

  task create_image2: :environment do

  	def create_logo(name,url,image_location)
		create_item(name,url)
		sleep(2)
		create_image(image_location,@uuid_item)
	end

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
	    pp response
	    pp @uuid_item
	end

	def create_image(image_location,uuid)
	  	response = Unirest.post'https://my.craftar.net/api/v0/image/?api_key=7fd139eb9ac68aad6f63dfb5fa12fb9f4ecf7a47', 
	    #response = Unirest.post'http://requestb.in/ogjwt5og', 

	        parameters: {
	            'item' => "/api/v0/item/#{uuid}/",
	       		'file' => File.open("#{image_location}")
	        }
	    pp response
	end
	create_logo("wyncode2","wwww.wyncode.com","./public/system/logos/images/000/000/004/large/Wyncode-color_logo.png")
  end
  
  task destroy_image: :environment do
  	response = Unirest.delete'https://my.craftar.net/api/v0/item/60261e3a1a7842889f2ffd1bcf36d167/?api_key=7fd139eb9ac68aad6f63dfb5fa12fb9f4ecf7a47',
	# response = Unirest.delete'http://requestb.in/ogjwt5og', 
	    headers:{"Content-Type" => "application/json"}

	pp response
  end

end


