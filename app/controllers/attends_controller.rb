class AttendsController < ApplicationController

  before_action :authenticate_user!, except:  [:show, :index]
  before_action :set_category, except: [:index, :new, :create]

  def create
    @attend = Attend.new(attend_params)

    if @attend.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def destroy
    @attend.destroy
    redirect_to events_path
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
