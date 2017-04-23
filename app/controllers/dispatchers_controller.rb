class DispatchersController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
 	before_action :set_dispatcher, except: [:index, :new, :create, :show]

 	def create
 		@dispatcher = Dispatcher.new(dispatcher_params)

 		if @dispatcher.save
 			redirect_to dispatchers_path
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@dispatcher.destroy	
 		redirect_to dispatchers_path
 	end

 	def edit
 	end

	def index
		@dispatchers =	Dispatcher.select(:person_id).uniq
	end

	def new
		@dispatcher = Dispatcher.new
	end

	def set_dispatcher
		@dispatcher = Dispatcher.find(params[:id])
	end

	def show
		@articles = Dispatcher.search_for_person_id(params[:id])
		@person = Person.find(params[:id])
	end

	def update
		if @dispatcher.update(dispatcher_params)
			redirect_to dispatchers_path
		else
			render 'edit'
		end
	end



	protected
	def dispatcher_params
		params.require(:dispatcher).permit(:name, :person_id, :product_id, :quantity)
	end

end
