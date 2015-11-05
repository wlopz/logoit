json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :url, :uuid
  json.url campaign_url(campaign, format: :json)
end
