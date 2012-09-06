class RemoveListItemIdColumn < ActiveRecord::Migration
  def change
    remove_column :venues, :list_item_id
  end
end
