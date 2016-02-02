json.array!(@submerchants) do |submerchant|
  json.extract! submerchant, :id
  json.url submerchant_url(submerchant, format: :json)
end
