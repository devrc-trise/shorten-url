class RedirectController < ApplicationController
  def index
    @link = Link.find_by_short_url_code(params[:code])
    log_visit if @link.present?
    # TODO: Handle invalid code. For now just redirect to home page.
    redirect_to @link&.redirect_url.presence || root_path
  end

  protected

  def log_visit
    @link.visits.create(
      remote_ip: request.remote_ip.presence || location.ip,
      user_agent: request.user_agent,
      referrer: request.referrer,
      latitude: location.latitude,
      longitude: location.longitude,
      address: location.address,
      city: location.city,
      state: location.state,
      postal_code: location.postal_code,
      country: location.country,
      country_code: location.country_code,
      browser_name: browser.name,
      browser_full_version: browser.full_version,
      browser_version: browser.version,
      device_id: browser.device.id,
      device_name: browser.device.name,
      platform_id: browser.platform.id,
      platform_name: browser.platform.name,
      platform_version: browser.platform.version
    )
  end

  def location
    @location ||= request.location
  end

  def browser
    @browser ||= Browser.new(request.user_agent)
  end
end
