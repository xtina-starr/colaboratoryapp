class ChangeMediaIdToString < ActiveRecord::Migration
  def change
    change_column :contents, :media_id, :string
  end
end
