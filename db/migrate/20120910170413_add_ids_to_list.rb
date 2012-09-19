class AddIdsToList < ActiveRecord::Migration
  def change
    add_column :lists, :good_for_id, :integer
    add_column :lists, :good_on_id, :integer
  end
end
