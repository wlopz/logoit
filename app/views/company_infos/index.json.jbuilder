json.array!(@company_infos) do |company_info|
  json.extract! company_info, :id, :company_name, :address, :website, :user_id
  json.url company_info_url(company_info, format: :json)
end
