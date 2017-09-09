module ApplicationHelper
  def api_meta_tags
    client = ApiClient.find_by_username('web')
    [
      tag('meta', name: 'api_client_username',  content: client&.username),
      tag('meta', name: 'api_client_password', content: client&.password)
    ].join("\n").html_safe
  end

  def base_url
    "#{request.protocol}#{host}"
  end

  def host
    request.port == 80 ? request.host : request.host_with_port
  end
end
