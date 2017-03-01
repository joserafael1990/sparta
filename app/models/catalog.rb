class Catalog < ApplicationRecord
	belongs_to :category, :foreign_key => 'category_id'

	def self.search_for_category_id(id)
		where("category_id = ?",id)        
	end
end
