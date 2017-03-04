class HomeController < ApplicationController
	def index
		if signed_in?
			if current_user.admin == true
      			redirect_to :controller => 'categories', :action => 'index' 
  			end
		end
	end
end