class AddMainToImageArtifacts < ActiveRecord::Migration
  def change
    add_column :image_artifacts, :main, :boolean, :default => false
  end
end
