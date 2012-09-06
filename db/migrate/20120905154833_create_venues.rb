class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :list_item_id
      t.string :name
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
