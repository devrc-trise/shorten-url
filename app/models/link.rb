class Link < ApplicationRecord
  URL_CODE_SIZE = 6

  has_many :visits

  validates :original_url, presence: true
  validates :short_url_code, presence: true, uniqueness: { case_sensitive: true }

  before_validation :shorten_url, on: :create

  def redirect_url
    original_url[/^https?:\/\//].present? ? original_url : "http://#{original_url}"
  end

  def visits_per_hour(start_date, end_date)
    start_time = start_date.beginning_of_day
    end_time = end_date.end_of_day
    scoped = visits.where(created_at: start_time..end_time)
    scoped.group('date_format(created_at, "%Y-%m-%d %H:00")').count
  end

  protected

  def shorten_url
    loop do
      self.short_url_code = generate_code(URL_CODE_SIZE)
      break if Link.where(short_url_code: self.short_url_code).count <= 0
    end
  end

  # XXX: For size 6 we have 56,800,235,584 possible permutations (if the online calculator was right!)
  # TODO: The size can be set in a global setting where it can be easily configured. For simplicity, let's hardcode it for now.
  def generate_code(size)
    charset = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]
    (0...size).map { charset[rand(charset.size)] }.join
  end
end
