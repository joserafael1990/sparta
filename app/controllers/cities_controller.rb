class CitiesController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_city, except: [:index, :new, :create, :find_cities_given_state_id]

	def create
		@city = City.new(city_params)

		if @city.save
			redirect_to @city
		else
			render 'new'
		end
	end

	def destroy
		@city.destroy
		redirect_to cities_path
	end

	def edit
	end


	def find_cities_given_state_id
	   state_id = params[:state_id]#utilizes the url to extract state_id ".../find_cities_given_state_id?state_id=1"
	   cities = City.search_for_state_id(state_id).order(:name).as_json#query the model for the data and convert it to a hash using as_json
	   respond_to do |format|
	   	format.json { 
	   		render json: cities
	   	} 
	   end
	end


	def index
		@search = City.ransack(params[:q])
		@cities = @search.result.page(params[:page]).per(20)
	end

	def new
		@city = City.new
	end

	def set_city
		@city = City.find(params[:id])
	end

	def show
	end

	def update
		if @city.update(city_params)
			redirect_to @city
		else
			render 'edit'
		end
	end

	protected
	def city_params
		params.require(:city).permit(:name, :state_id, :country_id)
	end

end
