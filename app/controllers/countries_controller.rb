 class CountriesController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_country, except: [:index, :new]
 	
 	def create
 		@country = Country.new(country_params)

 		if @country.save
 			redirect_to @country
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@country.destroy	
 		redirect_to countries_path
 	end

 	def edit
 	end

 	def index
		@search = Country.ransack(params[:q])
		@countries = @search.result.page(params[:page]).per(20).order(:name)
 	end

 	def new
 		@country = Country.new
 	end

 	def set_country
		@country = Country.find(params[:id])
 	end

 	def show
 	end

 	def update
 		if @country.update(country_params)
 			redirect_to @country
 		else
 			render 'edit'
 		end
 	end



 	protected
 	def country_params
 		params.require(:country).permit(:name)
 	end
 end

