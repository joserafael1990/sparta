class HomeController < ApplicationController
	def index
		if signed_in?
			if current_user.admin == true
				@domestics_total = Attend.includes(:event).where("events.address" => 'Av. Sonora 149-7').count
				@foreings_total = Attend.includes(:event).where.not("events.address" => 'Av. Sonora 149-7').count
				@courses = 	Attend.includes(:category).where("events.address" => 'Av. Sonora 149-7').order("events.event_date asc")
  			end
		end
	end
end