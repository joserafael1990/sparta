class ProductsController < ApplicationController
  before_action :authenticate_user!, except:  [:show, :index]
  before_action :set_product, except: [:index, :new, :create]
  
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def destroy
    @product.destroy  
    redirect_to products_path
  end

  def edit
  end

  def index
    @search = Product.ransack(params[:q])
    @products = @search.result.page(params[:page]).per(20).order(:name)
  end

  def new
    @product = Product.new
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def show
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end



  protected
  def product_params
    params.require(:product).permit(:name, :stock, :price, :cost, :max_discount)
  end

end
