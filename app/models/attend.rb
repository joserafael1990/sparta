class Attend < ApplicationRecord
	belongs_to :event, :foreign_key => 'event_id'
	belongs_to :person, :foreign_key => 'person_id'
	 
end
