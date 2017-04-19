class Event < ApplicationRecord
	belongs_to :catalog
	has_one :category, :through => :catalog

	belongs_to :city
  	has_one :state, :through => :city
  	has_one :country, :through => :state
  	
  	belongs_to :instructor, :class_name => 'Person'
  	belongs_to :host, :class_name => 'Person'
  	
  	has_many :attends
  	has_many :people, :through => :attends

	validates :address, :presence => {:message => "Usted ingresar una dirección"}
	validates :event_date, :presence => {:message => "Usted ingresar una fecha"}
	


end
