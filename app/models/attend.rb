class Attend < ApplicationRecord
	
	belongs_to :event, :foreign_key => 'event_id'
	has_one :catalog, :through => :event
	has_one :category, :through => :catalog
	belongs_to :person, :foreign_key => 'person_id'

	validates_uniqueness_of  :event_id, :scope => :person, message: 'Persona ya registrada en el evento'
	 
end
