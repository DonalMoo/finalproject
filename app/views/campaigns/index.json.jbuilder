json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :title, :max_code
  json.url campaign_url(campaign, format: :json)
end
