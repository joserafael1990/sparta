class SellsController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
 	before_action :set_sell, except: [:index, :new, :create]

 	def create
 		@sell = Sell.new(sell_params)

 		if @sell.save
 			redirect_to @sell
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@sell.destroy	
 		redirect_to sells_path
 	end

 	def edit
 	end


	def index
		@search = Sell.ransack(params[:q])
		@sells = @search.result.page(params[:page]).per(20).order(:created_at)
	end

	def new
		@sell = Sell.new
	end

	def set_sell
		@sell = Sell.find(params[:id])
	end

	def show
		@details = Detail.where(:sell_id => @sell.id)
	end

	def update
		if @sell.update(sell_params)
			redirect_to @sell
		else
			render 'edit'
		end
	end



	protected
	def sell_params
		params.require(:sell).permit(:seller_id, :client_id)
	end

end
