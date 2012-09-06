class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :venue_id
      t.text :description

      t.timestamps
    end
  end
end
