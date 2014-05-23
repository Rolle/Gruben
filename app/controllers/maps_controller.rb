class MapsController < ApplicationController
	before_filter :require_user

  	def index
  		@page_id = "map_"
  		@images_adit = ImageArtifact.where("imgtype = 0 and latitude not null and longitude not null")

      #Mundlöcher
      @main_count = ImageArtifact.where(:main => true).count

      #Gruben
      @adits_count = ImageArtifact.where(:primary => true).count
      #@adits_count = ImageArtifact.where("primary = 1 and latitude not null and longitude not null").count
      
      #Sonstiges
      @flag_count = @images_adit.size() - @main_count - @adits_count
      #@flag_count = ImageArtifact.where("primary <> 1 and and main <> 1 and latitude not null and longitude not null").count

      
  		@adits = Adit.with_images

      @places = Place.all
      #Ortes
      @places_count = @places.size()
  		#@adits = Adit.find(:all, :order => "name")
  	end

  	def adit
  		@page_id = "map_"
      id = params[:adit_id] || params[:id]
  		@images_adit = Adit.find(id).image_artifacts || Array.new
  		@adits = Adit.all.order(:name)
  		render "index"
  	end

    def image_artifact
      @page_id = "map_"
      @images_adit = ImageArtifact.where(:id => params[:id])      
      @adits = Adit.all.order(:name)
      render "index"
    end
end
