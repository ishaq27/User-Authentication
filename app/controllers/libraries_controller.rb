class LibrariesController < ApplicationController
  before_action :set_library, only:[:show, :delete, :update, :edit]
  def new
    @library = Library.new
  end

  def show
  end

  def edit
    #@library = Library.find(params[:id])
  
  end

  def create
    @library = Library.new(library_params)
    respond_to do |format|
      if @library.save
        format.html{redirect_to libraries_path, notice: 'Book addded successfull'}
      format.json{render :show, status: :created, location: @library}
    else
      format.html{render 'new'}
      format.json{render json: @library.errors, status: :unprocessable_entity}
    end
  end
  end

  def update
  end

  def destroy
    @library = Library.find(params[:id])
    respond_to do |format|
    @library.destroy

    format.html{redirect_to libraries_path, notice: 'Book deleted successfully'}
    format.json{head :no_content}
  end
  end

  def index
    @libraries = Library.all

  end

end

private
def set_library
  @library = Library.find(params[:id])
  end

def library_params
  params.require(:library).permit(:bookName, :auther, :subject, :noofcopy)
end