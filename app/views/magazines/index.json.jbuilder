json.array!(@magazines) do |magazine|
  json.extract! magazine, :id
  json.url magazine_url(magazine, format: :json)
end
