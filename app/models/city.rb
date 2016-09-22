class City < ApplicationRecord
  belongs_to :state
  validates :name, :presence => {:message => "Usted ingresar un nombre"}
end
