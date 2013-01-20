module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def link_icon(text, url, name, size=1, *options)
    #link_icon("Camera Retro button", "#","refresh",1)
    # <a class="refresh" href="#"><i style="font-size:1.5em" class="icon-refresh"></i> Camera Retro button</a>

    class_to_add = "#{name}"
    options.each { |opt| class_to_add += " #{opt}" } if !options.empty?
    link_to(url, html_options = { :class => class_to_add }) {icon(name, size) + " " + text}
  end

	def controller_stylesheet_link_tag
  	stylesheet = "#{params[:controller]}"
    
    if File.exists?("#{Rails.root}/app/assets/stylesheets/#{stylesheet}.css.scss")
      stylesheet_link_tag stylesheet
    end  
	end
end
