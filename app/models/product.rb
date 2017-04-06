class Product < ApplicationRecord
	validates :name, :presence => {:message => "Usted ingresar un nombre"}
	validates :price, :presence => {:message => "Usted ingresar un precio"}
	validates :max_discount, :presence => {:message => "Usted ingresar un descuento maximo"}

	validates_uniqueness_of  :name, message: 'El producto ya está registrado'
end
