class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :short_url_code, presence: true, uniqueness: true

  before_validation :shorten_url

  def redirect_url
    original_url[/^https?:\/\//].present? ? original_url : "http://#{original_url}"
  end

  protected

  def shorten_url
    self.short_url_code = generate_code(4)
  end

  # TODO: update shortening url logic. Not final, just for testing
  def generate_code(size)
    charset = %w{2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
end
