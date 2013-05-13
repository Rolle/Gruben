class AddImgflagToImageArtifacts < ActiveRecord::Migration
  def change
    add_column :image_artifacts, :flag, :integer
  end
end
