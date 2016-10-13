class PeopleController < ApplicationController
	before_action :authenticate_user!, except:  [:show, :index]
	before_action :set_person, except: [:index, :new, :create]

	def create
		@person = Person.new(person_params)

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
		def person_params
			params.require(:person).permit(:name, :last_name, :email, :sex, :job_title, :birth_date, :phone, :address, :delegation, :city_id, :state_id, :country_id, :employee, :instructor, :host, :patient, :student, :client)
		end

end
