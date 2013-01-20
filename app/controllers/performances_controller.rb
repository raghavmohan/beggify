class PerformancesController < ApplicationController
	# GET /performances
  # GET /performances.json
  def index
    @performer = Performer.find(params[:performer_id])
    @performances = @performer.performances

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @performances }
    end
  end

  # GET /performances/pay.js
  def pay
    @payments = Payment.where("performance_id = ? and created_at > ?", params[:performance_id], Time.at(params[:after].to_i + 1))
  end

  # GET /performances/1
  # GET /performances/1.json
  def show
    @performer = Performer.find(params[:performer_id])
    @performance = Performance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performance }
    end
  end

  # GET /performances/new
  # GET /performances/new.json
  def new
    @performer = Performer.find(params[:performer_id])
    @performance = @performer.performances.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @performance }
    end
  end

  # GET /performances/1/edit
  def edit
    @performance = Performance.find(params[:id])
  end

  # POST /performances
  # POST /performances.json
  def create
    #@performer = Performer.find(params[:performer_id])
    @performer = current_performer
		@performance = @performer.performances.build(params[:performance])

    respond_to do |format|
      if @performance.save
				if current_performer
					current_performer.current_performance = @performance.id
					current_performer.save
				end

				format.html { redirect_to performer_performances_path, notice: 'Performance was successfully created.' }
        format.json { render json: @performance, status: :created, location: @performance }
      else
        format.html { render action: "new" }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /performances/1
  # PUT /performances/1.json
  def update
    @performance = Performance.find(params[:id])

    respond_to do |format|
      if @performance.update_attributes(params[:performance])
        format.html { redirect_to performer_performances_path, notice: 'Performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performances/1
  # DELETE /performances/1.json
  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy

    respond_to do |format|
      format.html { redirect_to performer_performances_url }
      format.json { head :no_content }
    end
  end
end
