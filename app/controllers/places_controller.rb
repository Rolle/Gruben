class PlacesController < ApplicationController
  def download
    places = Place.all
    b = Builder::XmlMarkup.new
    b.instruct!
    xml = b.xml {
      b.kml {
        b.Document {
          b.name "Orte zum Untersuchen"
          places.each do |place| 
            b.Placemark {
              b.name place.description
              b.Point {
                b.coordinates "#{place.longitude},#{place.latitude},0"
              }
            }
          end
        }
      }
    }


    send_data(xml,   :type => 'text/xml; charset=UTF-8;', :disposition => "attachment; filename=adit_places.xml")
  end

  def index
  	@page_id = "place_create"
  	@places = Place.all
  end

  def create
  	@page_id = "place_create"
  	@place = Place.new(place_params)
  	@place.save
    flash[:notice] = "Ort wurde gespeichert!"
    redirect_to :action => :new
  end

  def new
  	@page_id = "place_new"
  	@place = Place.new
  end

  def destroy
    @page_id = "place_destroy"
    @place = Place.find(params[:id])
    @place.destroy
    flash[:notice] = "Datensatz wurde entfernt."
    redirect_to :action => :index
  end

  def edit
    @page_id = "place_edit"
    @place = Place.find(params[:id])
  end

  def update
  	@page_id = "place_update"
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    flash[:notice] = "Datensatz wurde aktualisiert."
    redirect_to :action => :index
  end

  private
  def place_params
    params.require(:place).permit(:description, :link, :latitude, :longitude)
  end  
end
