class SessionsController < ApplicationController
  def create
    performer = Performer.from_omniauth(env["omniauth.auth"])
    session[:performer_id] = performer.id
    
		if performer.venmo_id == nil
			redirect_to :controller => 'performers', :action => 'edit', :id => performer.id
		else
			redirect_to :controller => 'performances', :action => 'index', :performer_id => performer.id
  	end
	end

  def destroy
    session[:performer_id] = nil
    redirect_to root_url
  end
end
