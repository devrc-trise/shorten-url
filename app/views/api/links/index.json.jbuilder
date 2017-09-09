json.links @links do |link|
  json.extract! link, :id, :original_url, :shortened_url, :created_at
end

json.count @links.count
