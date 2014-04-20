class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :username
      t.string  :avatar
      t.string  :status
      t.string  :email
      t.string  :location
      t.string  :website
      t.string  :bio
      t.boolean :dj,           :default => false
      t.boolean :producer,     :default => false 
      t.boolean :rapper,       :default => false
      t.boolean :singer,       :default => false
      t.boolean :songwriter,   :default => false
      t.boolean :musician,     :default => false
      t.boolean :animator,     :default => false
      t.boolean :filmmaker,    :default => false
      t.boolean :videographer, :default => false
      t.boolean :editor,       :default => false

      t.timestamps
    end
  end
end
