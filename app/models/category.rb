class Category < ApplicationRecord
	validates :name, :presence => {:message => "Usted ingresar un nombre"}
	has_many :events, through: :cities
end
