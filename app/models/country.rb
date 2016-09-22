class Country < ApplicationRecord
	has_many :states
	has_many :cities, through: :state
	validates :name, :presence => {:message => "Usted ingresar un nombre"}
end
