class EventsController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
 	before_action :set_event, except: [:index, :new, :create]

 	def create
 		@event = Event.new(event_params)

 		if @event.save
 			redirect_to @event
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@event.destroy	
 		redirect_to events_path
 	end

 	def edit
 	end


	def index
		@search = Event.ransack(params[:q])
		@events = @search.result.page(params[:page]).per(20).order(:event_date)
	end

	def new
		@event = Event.new
	end

	def set_event
		@event = Event.find(params[:id])
	end

	def show
		@total = Attend.where(:event_id => @event).count
		@participants = Attend.where(:event_id => @event)
	end

	def update
		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end



	protected
	def event_params
		params.require(:event).permit(:event_date, :address, :host_id, :city_id, :catalog_id, :instructor_id)
	end
end
