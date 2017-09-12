RSpec.shared_examples 'respond to not authenticated' do |opts|
  it 'responds with 401' do
    send(opts[:method], opts[:action], params: params(opts))
    expect(response).to have_http_status(401)
  end
end

RSpec.shared_examples 'respond to authenticated' do |opts|
  before do
    api_client = ApiClient.first
    token = Base64.encode64 "#{api_client.username}:#{api_client.password}"
    request.headers['Authorization'] = "Basic #{token}"
  end

  it 'responds with 200' do
    send(opts[:method], opts[:action], params: params(opts))
    expect(response).to have_http_status(200)
  end
end

RSpec.shared_examples 'respond to missing' do |opts|
  before do
    api_client = ApiClient.first
    token = Base64.encode64 "#{api_client.username}:#{api_client.password}"
    request.headers['Authorization'] = "Basic #{token}"
  end

  it 'responds with 404' do
    send(opts[:method], opts[:action], params: params(opts))
    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['messages']).to include "Record not found."
  end
end

def params(e)
  (e[:params] || {}).merge({ format: e[:format] || :json })
end
