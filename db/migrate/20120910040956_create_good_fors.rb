class CreateGoodFors < ActiveRecord::Migration
  def change
    create_table :good_fors do |t|
      t.string :what
      t.timestamps
    end
  end
end
