class Dispatcher < ApplicationRecord
	belongs_to :product, :foreign_key => 'product_id'
	belongs_to :person, :foreign_key => 'person_id'

	validates :quantity, :presence => {:message => "Usted ingresar una cantidad"}
	
	validates_uniqueness_of  :product_id, :scope => :person, message: 'Esta persona ya tiene registrado este producto, favor edite la asignación'

	

	def self.search_for_person_id(id)
		where("person_id = ?", id)        
	end

end
