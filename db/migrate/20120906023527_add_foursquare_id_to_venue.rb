class AddFoursquareIdToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :foursquareid, :string
  end
end
