class CreateGoodOns < ActiveRecord::Migration
  def change
    create_table :good_ons do |t|
      t.string :daystring
      t.timestamps
    end
  end
end
