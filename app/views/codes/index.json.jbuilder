json.array!(@codes) do |code|
  json.extract! code, :id, :code, :redeemed_at, :campaign_id
  json.url code_url(code, format: :json)
end
