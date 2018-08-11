class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @documents = current_user.documents
  end

  def show
  end

  def new
    @document = current_user.documents.new
  end

  def edit
  end

  def create
    @document = current_user.documents.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def download 
    @document = current_user.documents.find_by_id(params[:id]) 
    if @document 
         send_file @document.uploaded_file.path, :type => @document.uploaded_file_content_type 
    else
      flash[:error] = "Can't download.."
      redirect_to documents_path 
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_document
      @document = current_user.documents.find(params[:id]) 
    end

    def document_params
      params.require(:document).permit(:user_id, :uploaded_file)
    end
end
