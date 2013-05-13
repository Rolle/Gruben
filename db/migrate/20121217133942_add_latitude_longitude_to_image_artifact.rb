class AddLatitudeLongitudeToImageArtifact < ActiveRecord::Migration
  def change
  	add_column :image_artifacts, :latitude, :float
  	add_column :image_artifacts, :longitude, :float
  end
end
