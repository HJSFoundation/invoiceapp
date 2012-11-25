module ApplicationHelper
	def is_active?(page_name)
		"current" if params[:controller] == page_name
	end
	
	def url_with_protocol(url)
		if url.blank?
			""
		else
			/^http/.match(url) ? url : "http://#{url}"
		end
  end
  
end
