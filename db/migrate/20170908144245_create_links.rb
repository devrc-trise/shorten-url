class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :original_url, null: false
      t.string :shortened_url, null: false, index: true
      t.string :user_ip

      t.timestamps
    end
  end
end
