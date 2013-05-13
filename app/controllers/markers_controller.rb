class MarkersController < ApplicationController
	before_filter :require_user
	respond_to :html, :js, :json

  	def create
  		@page_id = "markers_"
  		@marker = Marker.new(marker_params)
  		@marker.save!
      respond_to do |format|
          format.js { render :layout=>false }
          format.json { render :json => @marker}
      end
  	end

  	def index
  		@page_id = "markers_"
  	end

  	def new
  		@page_id = "markers_"
  		@marker = Marker.new
  	end

	def destroy
	    @page_id = "markers"
	    @marker = Marker.find(params[:id])
	    @marker.destroy
	    flash[:notice] = "Datensatz wurde entfernt."
	    respond_to do |format|
        	format.js { render :layout=>false }
    	end
	end

  private
  def marker_params
    params.require(:marker).permit(:description, :latitude, :longitude)
  end  
end