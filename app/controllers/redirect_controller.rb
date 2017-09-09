class RedirectController < ApplicationController
  def index
    @link = Link.find_by_short_url_code(params[:code])
    log_visit if @link.present?
    redirect_to @link&.redirect_url.presence || root_path
  end

  protected

  def log_visit

  end
end
