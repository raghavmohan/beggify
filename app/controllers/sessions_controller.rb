class SessionsController < ApplicationController
  def create
    performer = Performer.from_omniauth(env["omniauth.auth"])
    session[:performer_id] = performer.id
    redirect_to root_url
  end

  def destroy
    session[:performer_id] = nil
    redirect_to root_url
  end
end
