class State < ApplicationRecord
  belongs_to :country
  has_many :cities
  validates :name, :presence => {:message => "Usted ingresar un nombre"}
end
