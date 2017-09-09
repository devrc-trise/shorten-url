module ApplicationHelper
  def api_meta_tags
    client = ApiClient.find_by_username('web')
    [
      tag('meta', name: 'api_client_username',  content: client&.username),
      tag('meta', name: 'api_client_password', content: client&.password)
    ].join("\n").html_safe
  end
end
