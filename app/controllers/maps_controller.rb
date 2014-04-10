class MapsController < ApplicationController
	before_filter :require_user

  	def index
  		@page_id = "map_"
  		@images_adit = ImageArtifact.where("imgtype = 0 and latitude not null and longitude not null")
  		@adits = Adit.with_images
      @places = Place.all
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
