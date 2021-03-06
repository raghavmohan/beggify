class PerformersController < ApplicationController

  # GET /performers
  # GET /performers.json

	def login
		if current_performer != nil
			redirect_to :controller => 'performances', :action => 'index', :performer_id => current_performer.id
		end	
	end

	def nearby
		@p = nil
		@d = []
		if params[:longitude] != nil and params[:latitude] != nil
			@p = Performer.find(Performance.near([params[:latitude], params[:longitude]], 20).map{|p| p.performer_id})
			
			@p.each do |f|
				@d.push(Performance.find(f.current_performance).distance_from([params[:latitude], params[:longitude]]).round(0))
			end	
		end		
		render :json => {:performers => @p, :distances => @d}
	end

  def index
    @performers = Performer.all
  end

  # GET /performers/1
  # GET /performers/1.json
  def show
    @performer = Performer.find(params[:id])
    @payment = Payment.new
    @rating = rating(@performer)
    @city = "Madison, WI"
    @fb = "fb.me/#{@performer.venmo_id}"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performer }
    end
  end

  # GET /performers/new
  # GET /performers/new.json
  def new
    @performer = Performer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @performer }
    end
  end

  # GET /performers/1/edit
  def edit
    @performer = Performer.find(params[:id])
  end

  # POST /performers
  # POST /performers.json
  def create
    @performer = Performer.new(params[:performer])

    respond_to do |format|
      if @performer.save
        format.html { redirect_to @performer, notice: 'Performer was successfully created.' }
        format.json { render json: @performer, status: :created, location: @performer }
      else
        format.html { render action: "new" }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /performers/1
  # PUT /performers/1.json
  def update
    @performer = Performer.find(params[:id])

    respond_to do |format|
      if @performer.update_attributes(params[:performer])
        format.html { redirect_to @performer, notice: 'Performer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performers/1
  # DELETE /performers/1.json
  def destroy
    @performer = Performer.find(params[:id])
    @performer.destroy

    respond_to do |format|
      format.html { redirect_to performers_url }
      format.json { head :no_content }
    end
  end

  private
  def rating(performer)
    num_payments = 0
    performer.performances.each do |perf|
      perf.payments.each do |payment|
        num_payments += 1
      end
    end
    tmp = (1 > num_payments ? 1 : num_payments)
    5 < tmp ? 5 : tmp
  end
end
