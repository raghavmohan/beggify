class PaymentsController < ApplicationController
  def new
    @performer = Performer.find(params[:performer_id])
    @performance = @performer.performances.first
    @payment = @performance.payments.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  def create
    @performer = Performer.find(params[:performer_id])
    @performance = @performer.performances.first
    @payment = @performance.payments.build(params[:payment])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to venmo_link }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { redirect_to @performer }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def venmo_link
    "https://venmo.com/#{@performer.venmo_id}?txn=Pay&amount=#{@payment.amount}&note=for%20an%20awesome%20street%20performance!!!"
  end
end
