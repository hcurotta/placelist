class CreateGoodAts < ActiveRecord::Migration
  def change
    create_table :good_ats do |t|
      t.string :timestring

      t.timestamps
    end
  end
end
