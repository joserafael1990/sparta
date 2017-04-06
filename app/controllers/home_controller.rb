class HomeController < ApplicationController
	def index
		if signed_in?
			if current_user.active == true
				headquarter = 'Av. Sonora 149-7'
				@domestics_total = Attend.includes(:event).where("events.address" => headquarter).count
				@foreings_total = Attend.includes(:event).where.not("events.address" => headquarter).count
				@events = 	Event.includes(:category).where("address" => headquarter).order("event_date asc")
  			end
		end
	end
end