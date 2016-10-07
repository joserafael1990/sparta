class City < ApplicationRecord
	belongs_to :state
	has_one :country, :through => :state
	validates :name, :presence => {:message => "Usted ingresar un nombre"}

	def self.search_for_state_id(id)
		where("state_id = ?",id)        
	end
end
