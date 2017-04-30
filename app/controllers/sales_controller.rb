class SalesController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_sale, except: [:index, :new, :create, :close]

	def create
		@sale = Sale.new(sale_params)
		@sale.closed = false

		if @sale.save
			redirect_to @sale
		else
			render 'new'
		end
	end

	def close
		@sale = Sale.find(params[:id])
		items = Detail.where(:sale_id => @sale.id)
		items.each do |item|
			@dispatcher = Dispatcher.where(:product_id => item.product_id, :person_id => item.sale.seller_id).first
			old = @dispatcher.quantity
			@dispatcher.quantity = old - item.quantity
			@dispatcher.save
		end
		@sale.closed = true
		@sale.save

		redirect_to @sale
	end

	def destroy
		@sale.destroy	
		redirect_to sales_path
	end


	def index
		@search = Sale.ransack(params[:q])
		@sales = @search.result.page(params[:page]).per(20).order(:created_at)
	end

	def new
		@sale = Sale.new
	end

	def set_sale
		@sale = Sale.find(params[:id])
	end

	def show
		@details = Detail.where(:sale_id => @sale.id)

		respond_to do |format|
			format.html
			format.pdf do
				render pdf: "factura" , :template => 'sales/print.html.erb', :encoding => "utf8"
			end
		end
	end

	def print
		@details = Detail.where(:sale_id => @sale.id)

		respond_to do |format|
			format.html
			format.pdf do
				render pdf: "factura" , :template => 'sales/show.html.erb', :encoding => "utf8"
			end
		end
	end

	def update
		if @sale.update(sale_params)
			redirect_to @sale
		else
			render 'edit'
		end
	end



	protected
	def sale_params
		params.require(:sale).permit(:seller_id, :client_id, :closed)
	end

end
