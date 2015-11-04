namespace :test do
  desc "TODO"
  task api: :environment do

  	response = Unirest.post "https://search.craftar.net/v1/search",
  	parameters:{
	    "image" => File.new("cdbc0c38-a8f3-4bd8-80ec-ab12121b8a14.jpg"),
	    "token" => "c3ca8ca8a9d4472f"
	  }
	  # pp response.body["results"][0]["item"]["url"]

	  exec("open", "#{response.body["results"][0]["item"]["url"]}" )
  end

end
