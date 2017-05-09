class Detail < ApplicationRecord
	belongs_to :sale, :foreign_key => 'sale_id'
	belongs_to :product, :foreign_key => 'product_id'

	validates :quantity, :presence => {:message => "Ingrese cantidad"}
	validates_uniqueness_of  :sale_id, :scope => :product, message: 'Producto existente, por favor edítelo o eliminelo de esta venta'
end
