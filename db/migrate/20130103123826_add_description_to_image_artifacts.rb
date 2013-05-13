class AddDescriptionToImageArtifacts < ActiveRecord::Migration
  def change
    add_column :image_artifacts, :description, :string
  end
end
