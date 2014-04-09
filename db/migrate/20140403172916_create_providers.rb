class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :uid
      t.string :provider_type
      t.string :token
      t.string :secret
      t.string :avatar
      t.string :username
      t.integer :user_id
      t.string :email

      t.timestamps
    end
  end
end
