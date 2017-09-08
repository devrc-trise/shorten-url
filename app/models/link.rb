class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :shortened_url, presence: true

  before_validation :shorten_url

  protected

  def shorten_url
    self.shortened_url = original_url # TODO: shortening url logic here
  end
end
