json.links @links do |link|
  json.extract! link, :id, :original_url, :shortened_url, :created_at
  json.visits 0
end

json.count @links.count
