class CatalogsController < ApplicationController

  before_action :authenticate_user!, except:  [:show, :index]
  before_action :set_category, except: [:index, :new, :create, :find_products_given_category_id]

  def create
    @catalog = Catalog.new(catalog_params)

    if @catalog.save
      redirect_to @catalog
    else
      render 'new'
    end
  end

  def destroy
    @catalog.destroy
    redirect_to catalogs_path
  end

  def edit
  end

   	def find_products_given_category_id
	   category_id = params[:category_id]#utilizes the url to extract country_id ".../find_states_given_country_id?country_id=1"
	   catalogs = Catalog.search_for_category_id(category_id).order(:name).as_json#query the model for the data and convert it to a hash using as_json
	   respond_to do |format|
	   	format.json { 
	   		render json: catalogs
	   	} 
	   end
	end

  def index
    @search = Catalog.ransack(params[:q])
    @catalogs = @search.result.page(params[:page]).per(20).order(:name)
  end
  
  def new
    @catalog = Catalog.new
  end

  def set_category
    @catalog = Catalog.find(params[:id])
  end

  def show
  end

  def update
    if @catalog.update(catalog_params)
        redirect_to @catalog
    else
        render 'edit' 
    end
  end

  protected
    def catalog_params
      params.require(:catalog).permit(:name)
    end



end
