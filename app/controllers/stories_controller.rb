class StoriesController < ApplicationController

    before_action :find_story, except: [:new, :create, :index]

    def index
      @contributions = Contribution.all
      @stories = Story.all.sort_by{|story| story.contributions.last.created_at}.reverse.paginate(:page => params[:page],:per_page => 20)
    end

    def new
      @story = Story.new
      @image = Image.all.sample
      render :template => "images/show"
    end

    def create

    end

    def show
      @image = Image.all.sample
      @contribution = @image.contributions.new
      render template: "contributions/new"
    end

    def edit

    end

    def update

    end

    def destroy

    end

  private
    #
    # def story_params
    #   params.require(:story).permit(:body)
    # end

    def find_story
      @story = Story.find(params[:id])
    end
end
