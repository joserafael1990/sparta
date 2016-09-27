class CitiesController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_city, except: [:index, :new, :create]

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
