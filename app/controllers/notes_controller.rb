class NotesController < ApplicationController
  def create
    @page_id = "note_create"
    @note = Note.new(params[:adit])
    @note.save
    flash[:notice] = "Notizen wurden gespeichert!"
    redirect_to :action => :index
  end

  def show
    @page_id = "note_edit"
    @note = Note.find(params[:id])
  end

  def edit
    @page_id = "note_edit"
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update_attributes(note_params)
    flash[:notice] = "Datensatz wurde aktualisiert."
    redirect_to :action => :index
  end

  def new
    @page_id = "note_new"
    @note = Note.new
  end

  def index
    @page_id = "note_index"
    @note = Note.find :first
  end

  private
  def note_params
    params.require(:note).permit(:notice, :titel)
  end   
end
