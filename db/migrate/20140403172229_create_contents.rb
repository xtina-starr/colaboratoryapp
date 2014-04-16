class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :user_id
      t.integer :provider_id
      t.boolean :collab, :default => false
      t.boolean :feedback, :default => false
      t.boolean :latest, :default => false
      t.integer :media_id
      t.string  :title
      t.string  :media_type

      t.timestamps
    end
  end
end
