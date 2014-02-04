class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :family_name
      t.string :given_name
      t.string :email
      t.string :auth_token
      t.string :refresh_token

      t.timestamps
    end
  end
end
