class City < ApplicationRecord
  belongs_to :state
  has_one :country, :through => :state
  validates :name, :presence => {:message => "Usted ingresar un nombre"}
end
