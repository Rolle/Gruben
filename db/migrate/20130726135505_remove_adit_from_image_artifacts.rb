class RemoveAditFromImageArtifacts < ActiveRecord::Migration
  def change
    add_column :image_artifacts, :primary, :boolean, :default => false
  end
end
