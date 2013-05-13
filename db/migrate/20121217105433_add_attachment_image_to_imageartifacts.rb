class AddAttachmentImageToImageartifacts < ActiveRecord::Migration
  def self.up
    change_table :image_artifacts do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :image_artifacts, :image
  end
end
