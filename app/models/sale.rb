class Sale < ApplicationRecord
	belongs_to :client, :class_name => 'Person'
	belongs_to :seller, :class_name => 'Person'

	has_many :details
	has_many :products, :through => :details

	validates :bill_request, :presence => {:message => "Seleccione una opción en el campo: Solicitud de factura"}
	ransack_alias :vendido_en, :created_at

end
