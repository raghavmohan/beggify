class HomeController < ApplicationController
  def index
  end

	def performer
	end

  # GET /nearest_performers/1
  # GET /nearest_performers/1.json
  def nearest_performers
    @distance = 0
    @performer = Performer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performer }
    end
  end
end
