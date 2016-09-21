class State < ApplicationRecord
	validates :name, :presence => {:message => "Usted ingresar un nombre"}
	has_many :cities, dependent: :destroy
end
