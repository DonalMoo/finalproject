json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :id, :description, :price, :image_url
  json.url tutorial_url(tutorial, format: :json)
end
