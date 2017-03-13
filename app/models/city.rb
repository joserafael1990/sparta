class City < ApplicationRecord
	belongs_to :state, :foreign_key => 'state_id'
	has_one :country, :through => :state
	validates :name, :presence => {:message => "Usted ingresar un nombre"}

	validates_uniqueness_of  :name, :scope => :state

	def self.search_for_state_id(id)
		where("state_id = ?",id)        
	end
end
