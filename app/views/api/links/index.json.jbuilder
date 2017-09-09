json.links @links do |link|
  json.extract! link, :id, :original_url, :short_url_code, :created_at
  json.visits link.visits.count
end

json.count @links.count
