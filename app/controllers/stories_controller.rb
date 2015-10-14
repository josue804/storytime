class StoriesController < ApplicationController
  before_action :find_story, except: [:new, :create, :index]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
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

  def story_params
    params.require(:story).permit(:body)
  end

  def find_story
    Story.find(params[:story_id])
  end

end
