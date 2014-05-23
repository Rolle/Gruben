class AditsController < ApplicationController
  before_filter :require_user

  def index
  	@page_id = "adit_index"
    @adits = Adit.all.order(name: :asc)
  end

  def create
  	@page_id = "adit_create"
  	@adit = Adit.new(adit_params)
  	@adit.save
    flash[:notice] = "Grube/Stollen wurde gespeichert!"
    redirect_to :action => :new
  end

  def new
  	@page_id = "adit_new"
  	@adit = Adit.new
  end

  def destroy
    @page_id = "adit_destroy"
    @adit = Adit.find(params[:id])
    @adit.destroy
    flash[:notice] = "Datensatz wurde entfernt."
    redirect_to :action => :index
  end

  def edit
    @page_id = "adit_edit"
    @adit = Adit.find(params[:id])
  end

  def update
    @adit = Adit.find(params[:id])
    @adit.update_attributes(adit_params)
    flash[:notice] = "Datensatz wurde aktualisiert."
    redirect_to :action => :index
  end

  private
  def adit_params
    params.require(:adit).permit(:description, :name, :owner)
  end
end
