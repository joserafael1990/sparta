 class StatesController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_state, except: [:index, :new, :create, :find_states_given_country_id]

 	def create
 		@state = State.new(state_params)

 		if @state.save
 			redirect_to @state
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@state.destroy	
 		redirect_to states_path
 	end

 	def find_states_given_country_id
	   country_id = params[:country_id]#utilizes the url to extract country_id ".../find_states_given_country_id?country_id=1"
	   states = State.search_for_country_id(country_id).order(:name).as_json#query the model for the data and convert it to a hash using as_json
	   respond_to do |format|
	        format.json { 
	            render json: states
	        } 
	   end
	end

 	def edit
 	end

 	def index
		@search = State.ransack(params[:q])
		@states = @search.result.page(params[:page]).per(20).order(:name)
 	end

 	def new
 		@state = State.new
 	end

 	def set_state
 		@state = State.find(params[:id])
 	end

 	def show
 	end

 	def update
 		if @state.update(state_params)
 			redirect_to @state
 		else
 			render 'edit'
 		end
 	end



 	protected
 	def state_params
 		params.require(:state).permit(:name, :country_id)
 	end
 end
