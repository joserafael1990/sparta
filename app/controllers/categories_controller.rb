class CategoriesController < ApplicationController
  before_action :authenticate_user!, except:  [:show, :index]
  before_action :set_category, except: [:index, :new]

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def edit
  end

  def index
    @search = Category.ransack(params[:q])
    @categories = @search.result.page(params[:page]).per(20).order(:name)
  end
  
  def new
    @category = Category.new
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def show
  end

  def update
    if @category.update(category_params)
        redirect_to @category
    else
        render 'edit' 
    end
  end

  protected
    def category_params
      params.require(:category).permit(:name)
    end
end
