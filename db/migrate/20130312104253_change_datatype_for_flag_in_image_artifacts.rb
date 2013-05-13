class ChangeDatatypeForFlagInImageArtifacts < ActiveRecord::Migration
  def self.up
    change_table :image_artifacts do |t|
    	t.remove :flag
    	t.boolean :flag
    end
  end
  def self.down
    change_table :image_artifacts do |t|
    	t.remove :flag
    	t.integer :flag
    end
  end
end
