class ImageArtifactsController < ApplicationController
  before_filter :require_user
  respond_to :html, :js, :json

  def download
    image_artifacts = ImageArtifact.all
    b = Builder::XmlMarkup.new
    b.instruct!
    xml = b.xml {
      b.kml {
        b.Document {
          b.name "Gruben"
          image_artifacts.each do |image| 
            b.Placemark {
              b.name image.adit.name
              b.Point {
                b.coordinates "#{image.longitude},#{image.latitude},0"
              }
            }
          end
        }
      }
    }


    send_data(xml,   :type => 'text/xml; charset=UTF-8;', 
                                  :disposition => "attachment; filename=image_artifacts.kml")
  end

  def new
  	@page_id = "image_upload"
  	@image_artifact = ImageArtifact.new
    @adits = Adit.find(:all, :order => "name ASC")
  end

  def primary
    @page_id = "image_"
    @image = ImageArtifact.find(params[:id])
    @image.update_attribute(:primary, !@image.primary)
    render :nothing => true
  end

  def flag
    @page_id = "image_"
    @image = ImageArtifact.find(params[:id])
    @image.update_attribute(:flag, !@image.flag)
    render :nothing => true
  end

  def main
    @page_id = "image_"
    @image = ImageArtifact.find(params[:id])
    @image.update_attribute(:main, !@image.main)
    render :nothing => true
  end

  def adit
    @page_id = "image_"
    @images = Adit.find(params[:adit_id]).image_artifacts
    @adits = Adit.with_images
    render "index"
  end

  def create
  	@page_id = "image_"
  	@image_artifact = ImageArtifact.new(image_artifact_params)
  	@image_artifact.save!
    flash[:notice] = "Bild wurde hochgeladen und gespeichert!"
  	redirect_to :action => :new
  end

  def index
  	@page_id = "image_index"
    @images = ImageArtifact.find(:all, :order => "created_at")
    @adits = Adit.with_images
  end

  def show
    @page_id = "image_show"
    @image = ImageArtifact.find(params[:id])
  end

  def edit
    @page_id = "image_edit"
    @image = ImageArtifact.find(params[:id])
    @adits = Adit.find(:all, :order => 'name')
  end

  def update
    @page_id = "image_update"
    @image = ImageArtifact.find(params[:id])
    flash[:notice] = "Datensatz wurde aktualisiert."
    @image.update_attributes(image_artifact_params)
    redirect_to :action => :index
  end

  private
  def image_artifact_params
    params.require(:image_artifact).permit(:adit_id, :image, :imgtype, :description, :flag)
  end  
end
