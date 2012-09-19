class CreateListAttributes < ActiveRecord::Migration
  def change
    create_table :list_attributes do |t|
      t.integer :list_id
      t.text :attr
      t.timestamps
    end
  end
end
