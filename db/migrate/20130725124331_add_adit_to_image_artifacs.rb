class AddAditToImageArtifacs < ActiveRecord::Migration
  def change
    add_column :image_artifacts, :adit, :boolean, :default => false
  end
end
