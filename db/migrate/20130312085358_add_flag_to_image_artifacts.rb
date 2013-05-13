class AddFlagToImageArtifacts < ActiveRecord::Migration
  def change
    add_column :image_artifacts, :type, :integer
  end
end
