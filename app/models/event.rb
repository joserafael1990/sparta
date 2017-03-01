class Event < ApplicationRecord
	belongs_to :catalog
	belongs_to :category
	belongs_to :city
	belongs_to :state
	belongs_to :country
  	belongs_to :instructor, :class_name => 'Person'
  	belongs_to :host, :class_name => 'Person'

	validates :address, :presence => {:message => "Usted ingresar una dirección"}
	validates :event_date, :presence => {:message => "Usted ingresar una fecha"}
	


end
