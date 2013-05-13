class AddImgtypeToImageArtifacts < ActiveRecord::Migration
  def change
    add_column :image_artifacts, :imgtype, :integer
  end
end
