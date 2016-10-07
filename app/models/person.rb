class Person < ApplicationRecord
  belongs_to :city

  has_one :state, :through => :city
  has_one :country, :through => :state

  validates :name, :presence => {:message => "Usted ingresar un nombre"}
  validates :last_name, :presence => {:message => "Usted ingresar un apellido"}
  validates :birth_day, :presence => {:message => "Usted ingresar una fecha de nacimiento"}
  validates :sex, :presence => {:message => "Usted ingresar un sexo"}
  validates :job_title, :presence => {:message => "Usted ingresar un oficio"}
  validates :address, :presence => {:message => "Usted ingresar una dirección"}
end
