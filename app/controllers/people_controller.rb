class PeopleController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_person, except: [:index, :new, :create]

	def create
		@person = Person.new(Person_params)

		if @person.save
			redirect_to @person
		else
			render 'new'
		end
	end

	def destroy
		@person.destroy
		redirect_to people_path
	end

	def edit
	end

	def index
		@search = Person.ransack(params[:q])
		@people = @search.result.page(params[:page]).per(20)
	end


	def new
		@person = Person.new
	end

	def set_person
		@person = Person.find(params[:id])
	end

	def show
	end

	def update
		if @person.update(person_params)
			redirect_to @person
		else
			render 'edit'
		end
	end

	protected
		def Person_params
			params.require(:Person).permit(:name, :last_name, :sex, :birth_date, :address, :job_description, :state_id, :country_id)
		end

end
