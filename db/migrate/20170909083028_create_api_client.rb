class CreateApiClient < ActiveRecord::Migration[5.1]
  def change
    create_table :api_clients do |t|
      t.string :username, null: false, index: true
      t.string :password, null: false, index: true

      t.timestamps
    end
  end
end
