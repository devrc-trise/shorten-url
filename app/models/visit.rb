class Visit < ApplicationRecord
  belongs_to :link

  def self.create_from_request(request, link_id)
    location = request.location
    browser = Browser.new(request.user_agent)
    Visit.create(
      link_id: link_id,
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
end
