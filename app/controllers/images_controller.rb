class ImagesController < ApplicationController

  before_action :find_image, except: [:new, :create, :index]

  def index
    @images = Image.all.order(:created_at => :desc).paginate(:page => params[:page],:per_page => 20)
  end

  def new
    # @image = Image.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

private
  #
  # def image_params
  #   params.require(:image).permit(:body)
  # end

  def find_image
    @image = Image.find(params[:id])
  end

end
