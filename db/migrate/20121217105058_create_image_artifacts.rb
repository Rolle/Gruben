class CreateImageArtifacts < ActiveRecord::Migration
  def change
    create_table :image_artifacts do |t|
      t.integer :adit_id

      t.timestamps
    end
  end
end
