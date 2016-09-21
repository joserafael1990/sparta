class CitiesController < ApplicationController

	def create
		@city = City.new(city_params)

		if @city.save
			redirect_to @city
		else
			render 'new'
		end
	end

	def destroy
		@city = City.find(params[:id])
		@city.destroy
		redirect_to cities_path
	end

	def edit
		@city = City.find(params[:id])
	end

	def index
		@cities = City.order(:name)
	end

	def new
		@city = City.new
	end

	def show
		@city = City.find(params[:id])
	end

	def update
		@city = City.find(params[:id])

		if @city.update(city_params)
			redirect_to @city
		else
			render 'edit'
		end
	end

	protected
	def city_params
		params.require(:city).permit(:name, :state_id)
	end

end
