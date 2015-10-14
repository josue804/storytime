class StoriesController < ApplicationController
  before_action :find_story, except: [:new, :create, :index]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]

  def index
    @stories = Story.all.sort_by &:created_at
    @stories.reverse!
  end

  def new
    @image = Image.find(params[:image_id])
    @story = Story.new
  end

  def create
    @image = Image.find(params[:image_id])
    @story = @image.stories.new(story_params)
    @story.user = current_user
    if @story.save
      redirect_to image_story_path(@image.id, @story.id)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:image_id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def story_params
    params.require(:story).permit(:body)
  end

  def find_story
    @story = Story.find(params[:id])
  end

end
