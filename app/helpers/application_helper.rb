module ApplicationHelper

	def controller_stylesheet_link_tag
  	stylesheet = "#{params[:controller]}"
    
    if File.exists?("#{Rails.root}/app/assets/stylesheets/#{stylesheet}.css.scss")
      stylesheet_link_tag stylesheet
    end  
	end

end
