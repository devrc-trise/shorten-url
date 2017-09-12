class Visit < ApplicationRecord
  belongs_to :link

  validates :link, presence: true
end
