class ContributionsController < ApplicationController
  before_action :find_contribution, except: [:new, :create, :index]
  before_action :authenticate_user!, only: [:create, :new, :destroy, :edit, :update]

  def index
    @contributions = Contribution.all.order(:created_at => :desc).paginate(:page => params[:page],:per_page => 5)
  end

  def new
    if params[:story_id] != nil
      @story = Story.find(params[:story_id])
    else
      @story = Story.new
    end
    @image = Image.all.sample
    @contribution = Contribution.new
    if params[:image_show]
      respond_to do |format|
        format.js
      end
    end
  end

  def create
    @image = Image.find(params[:image_id])
    @contribution = @image.contributions.new(contribution_params)
    @contribution.user = current_user
    if params[:story_id] != ""
      @story = Story.find(params[:story_id])
    else
      @story = Story.create!
    end
      @contribution.story = @story
    if @contribution.save
      redirect_to new_story_contribution_path(@story)
    else
      redirect_to new_story_contribution_path(@story)
      # render :new
    end
  end

  def show
    respond_to do |format|
      format.js
    end
    @image = Image.find(params[:image_id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def contribution_params
    params.require(:contribution).permit(:body)
  end

  def find_contribution
    @contribution = Contribution.find(params[:id])
  end

end
