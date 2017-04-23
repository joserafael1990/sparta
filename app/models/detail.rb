class Detail < ApplicationRecord
	belongs_to :sell, :foreign_key => 'sell_id'
	belongs_to :product, :foreign_key => 'product_id'
end
