class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.float :latitude
      t.float :longitude
      t.string :description

      t.timestamps
    end
  end
end
