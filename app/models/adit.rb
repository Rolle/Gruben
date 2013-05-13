class Adit < ActiveRecord::Base
  has_many :image_artifacts
  validates :name, :uniqueness => true

  	def self.with_images
  		a = Array.new
   		joins(:image_artifacts).select("distinct(adits.id)").order("NAME asc").each do |adit|
   			a << Adit.find(adit.id)
   		end
   		a
	end
end
