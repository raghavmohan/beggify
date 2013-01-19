class ApplicationController < ActionController::Base
  protect_from_forgery

	def current_performer
  		@current_performer ||= Performer.find(session[:performer_id]) if session[:performer_id]
	end
	helper_method :current_performer

end
