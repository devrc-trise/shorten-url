class Api::BaseController < ActionController::Base
  before_action :api_auth

  rescue_from ActiveRecord::RecordInvalid, with: :bad_request
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  protected

  def api_auth
    # authenticate_or_request_with_http_basic do |name, token|
    #   @current_api_client = ApiClient.find_by(name: name, token: token)
    # end
  end

  def bad_request(e)
    messages = e&.record&.errors&.full_messages.presence || ['There are validation errors.']
    render json: { messages: messages }, status: :bad_request
  end

  def not_found
    render json: { messages: ['Record not found.'] }, status: :not_found
  end
end
