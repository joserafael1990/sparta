class DetailsController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
 	before_action :set_detail, except: [:index, :new, :create]

 	def create
 		@detail = Detail.new(detail_params)

 		if @detail.save
 			redirect_to sale_path(@detail.sale_id)
 		else
 			render 'new'
 		end
 	end

 	def destroy
 		@detail.destroy	
 		redirect_to  sale_path(@detail.sale_id)
 	end

 	def edit
 	end


	def index
		@search = Detail.ransack(params[:q])
		@details = @search.result.page(params[:page]).per(20).order(:created_at)
	end

	def new
		@detail = Detail.new
	end

	def set_detail
		@detail = Detail.find(params[:id])
	end

	def show
	end

	def update
		if @detail.update(detail_params)
			redirect_to sale_path(@detail.sale_id)
		else
			render 'edit'
		end
	end



	protected
	def detail_params
		params.require(:detail).permit(:product_id, :quantity,:sale_id)
	end

end

