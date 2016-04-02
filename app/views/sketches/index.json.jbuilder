json.array!(@sketches) do |sketch|
  json.extract! sketch, :id, :image, :description
  json.url sketch_url(sketch, format: :json)
end
