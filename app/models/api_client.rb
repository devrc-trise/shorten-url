class ApiClient < ActiveRecord::Base
  SALT = 'ae3e1e4ab02741fb8d090310bff15839a5aa57f4'

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  before_validation :generate_password

  protected

  def generate_password
    self.password ||= Digest::SHA1.hexdigest("#{SALT}#{Time.current.to_i}#{username}")
  end
end
