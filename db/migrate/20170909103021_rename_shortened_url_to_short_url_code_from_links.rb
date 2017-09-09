class RenameShortenedUrlToShortUrlCodeFromLinks < ActiveRecord::Migration[5.1]
  def change
    rename_column :links, :shortened_url, :short_url_code
  end
end
