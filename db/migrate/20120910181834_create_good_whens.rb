class CreateGoodWhens < ActiveRecord::Migration
  def change
    create_table :good_whens do |t|
      t.string :weather_is

      t.timestamps
    end
  end
end
