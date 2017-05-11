class PeopleController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_person, except: [:index, :new, :create, :find_location_given_people_id]

	def create
		@person = Person.new(person_params)
 		if current_user.privilege == 'vendor'
 			@person.client = 1
 		end
		if @person.save
			if current_user.privilege == 'vendor'
				redirect_to sales_path
			else
				redirect_to @person
			end
		else
			render 'new'
		end
	end

	def destroy
		@person.destroy
		redirect_to people_path
	end

	def edit
	end

	def find_location_given_people_id
	   @location = Person.includes(:city, :state, :country).find(params[:people_id])#query the model for the data and convert it to a hash using as_json
	   @city = City.find(@location.city_id)
	   @state = State.find(@city.state_id)
	   @country = Country.find(@state.country_id)
	   respond_to do |format|
	   	format.json { 
	   		render :json => {:location => @location, :city => @city, :state => @state, :country => @country}
	   	} 
	   end
	end

	def index
		@search = Person.ransack(params[:q])
		@people = @search.result.page(params[:page]).per(20)   
		@search.build_condition
	end


	def new
		@person = Person.new
	end

	def set_person
		@person = Person.find(params[:id])
	end

	def show
		@total = Attend.where(:person_id => @person).count

		@courses = Attend.includes(:category).order("events.event_date asc").where(:person_id => @person.id)
	end

	def update
		if @person.update(person_params)
			redirect_to @person
		else
			render 'edit'
		end
	end

	protected
	def person_params
		params.require(:person).permit(:name, :last_name, :email, :sex, :job_title, :birth_date, :phone, :address, :neighborhood, :zip_code, :delegation, :city_id, :state_id, :country_id, :employee, :instructor, :membership, :host, :patient, :student, :client, :whosaler)
	end

end
