class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :link, null: false, index: true
      t.string :remote_ip
      t.string :user_agent
      t.string :referrer
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :country_code
      t.string :browser_name
      t.string :browser_full_version
      t.string :browser_version
      t.string :device_id
      t.string :device_name
      t.string :platform_id
      t.string :platform_name
      t.string :platform_version

      t.timestamps
    end
  end
end
