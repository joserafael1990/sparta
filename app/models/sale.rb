class Sale < ApplicationRecord
	belongs_to :client, :class_name => 'Person'
	belongs_to :seller, :class_name => 'Person'

	has_many :details
	has_many :products, :through => :details
end
