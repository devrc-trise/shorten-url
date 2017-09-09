class Link < ApplicationRecord
  has_many :visits

  validates :original_url, presence: true
  validates :short_url_code, presence: true, uniqueness: { case_sensitive: true }

  before_validation :shorten_url

  def redirect_url
    original_url[/^https?:\/\//].present? ? original_url : "http://#{original_url}"
  end

  protected

  def shorten_url
    loop do
      self.short_url_code = generate_code(6)
      break if Link.where(short_url_code: self.short_url_code).count <= 0
    end
  end

  # for size 6 we have 56,800,235,584 possible permutations (if the online calculator was right!)
  # TODO: find a way to make the size dynamic. i.e. increment it when we almost reach the limit
  def generate_code(size)
    charset = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]
    (0...size).map { charset[rand(charset.size)] }.join
  end
end
