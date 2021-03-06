class State < ApplicationRecord
  belongs_to :country, :foreign_key => 'country_id'
  has_many :cities
  has_many :people, through: :cities
  validates :name, :presence => {:message => "Usted ingresar un nombre"}

  validates_uniqueness_of  :name, :scope => :country

  def self.search_for_country_id(id)
  	where("country_id = ?",id)        
  end
end
