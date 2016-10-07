class Country < ApplicationRecord
	has_many :states
	has_many :cities, through: :state
	has_many :people, through: :cities
	validates :name, :presence => {:message => "Usted ingresar un nombre"}
end
