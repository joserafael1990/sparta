class State < ApplicationRecord
  belongs_to :country, :foreign_key => 'country_id'
  has_many :cities
  accepts_nested_attributes_for :cities
  validates :name, :presence => {:message => "Usted ingresar un nombre"}

     def self.search_for_country_id(id)
        where("country_id = ?",id)        
    end
end
