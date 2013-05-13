class RemoveTypeFromImageArtifacts < ActiveRecord::Migration
  def up
    remove_column :image_artifacts, :type
  end

  def down
    add_column :image_artifacts, :type, :integer
  end
end
