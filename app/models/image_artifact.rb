class ImageArtifact < ActiveRecord::Base
	require "exifr"
	belongs_to :adit
	has_attached_file :image,:styles => { :thumb => "250x250>" }
	validates :image, :attachment_presence => true
  validates :image_file_name, :uniqueness => true
	after_post_process :extract_geotags

  	private
  	def extract_geotags
  		img = EXIFR::JPEG.new(self.image.queued_for_write[:original].path)
  		if !img.gps.nil?
  		  self.latitude = img.gps.latitude
  		  self.longitude = img.gps.longitude
      end
  		true
  	end
end
