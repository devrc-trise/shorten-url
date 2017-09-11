json.links @links do |link|
  json.extract! link, :id, :original_url, :short_url_code, :created_at
  json.visits link.visits.count
end
json.page @page
json.per_page @per_page
json.total @links.count
