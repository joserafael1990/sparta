class AttendsController < ApplicationController

  before_action :authenticate_user!, except:  [:show, :index]
  before_action :set_category, except: [:index, :new, :create, :show]

  def create
    @attend = Attend.new(attend_params)

    if @attend.save
      redirect_to event_path(@attend.event_id)
    else
      render 'new'
    end
  end

  def destroy
    @attend.destroy
    redirect_to event_path(@attend.event_id)
  end

  def edit
  end


  def index
    @search = Attend.ransack(params[:q])
    @attends = @search.result.page(params[:page]).per(20).order(:name)
  end
  
  def new
    @attend = Attend.new
  end

  def set_category
    @attend = Attend.find(params[:id])
  end

  def show
     @attends = Attend.where(:event_id => params[:id])
  end

  def update
    if @attend.update(attend_params)
      redirect_to @attend
    else
      render 'edit' 
    end
  end

  protected
  def attend_params
    params.require(:attend).permit(:comming_from, :event_id, :person_id)
  end



end
