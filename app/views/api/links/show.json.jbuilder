json.link do
  json.extract! @link, :id, :original_url, :short_url_code, :user_ip
  json.visits @link.visits.count
end
