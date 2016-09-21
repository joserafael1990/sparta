 class StatesController < ApplicationController
 	
 	def create
 		@state = State.new(state_params)

 		if @state.save
 			redirect_to @state
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@state = State.find(params[:id])
 		@state.destroy	

 		redirect_to states_path
 	end

 	def edit
 		@state = State.find(params[:id])
 	end

 	def index
 		@states = State.order(:name)
 	end

 	def new
 		@state = State.new
 	end

 	def show
 		@state = State.find(params[:id])
 	end

 	def update
 		@state = State.find(params[:id])

 		if @state.update(state_params)
 			redirect_to @state
 		else
 			render 'edit'
 		end
 	end



 	protected
 	def state_params
 		params.require(:state).permit(:name)
 	end
 end
