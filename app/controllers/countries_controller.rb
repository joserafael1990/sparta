class CountriesController < ApplicationController
 	
 	def create
 		@country = Country.new(country_params)

 		if @country.save
 			redirect_to @country
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@country = Country.find(params[:id])
 		@country.destroy	

 		redirect_to countries_path
 	end

 	def edit
 		@country = Country.find(params[:id])
 	end

 	def index
 		@countries = Country.order(:name)
 	end

 	def new
 		@country = Country.new
 	end

 	def show
 		@country = Country.find(params[:id])
 	end

 	def update
 		@country = Country.find(params[:id])

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

