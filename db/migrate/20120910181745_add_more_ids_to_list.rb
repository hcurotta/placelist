class AddMoreIdsToList < ActiveRecord::Migration
  def change
    add_column :lists, :good_at_id, :integer
    add_column :lists, :good_when_id, :integer
  end
end
