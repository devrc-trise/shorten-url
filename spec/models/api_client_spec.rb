RSpec.describe ApiClient, type: :model do
  fixtures :api_clients

  let(:api_tester) { api_clients(:api_tester) }

  describe '.create' do
    it 'should generate password' do
      api_client = ApiClient.create username: 'testuser'
      expect(api_client.password).to be
    end

    it 'should require username' do
      api_client = ApiClient.create
      expect(api_client.errors.full_messages).to include "Username can't be blank"
    end

    it 'should validate unique username' do
      api_client = ApiClient.create username: api_tester.username
      expect(api_client.errors.full_messages).to include "Username has already been taken"
    end
  end
end
