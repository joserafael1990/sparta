class Person < ApplicationRecord
  belongs_to :city

  has_one :state, :through => :city
  has_one :country, :through => :state

  has_many :instructor_courses, :class_name => 'Event', :foreign_key => 'instructor_id'
  has_many :host_courses, :class_name => 'Event', :foreign_key => 'host_id'

  has_many :attends
  has_many :events, through: :attends
  has_many :catalogs, through: :events
  has_many :categories, through: :catalogs
  has_many :dispatchers

  validates :name, :presence => {:message => "Usted ingresar un nombre"}
  validates :last_name, :presence => {:message => "Usted ingresar un apellido"}
  validates :sex, :presence => {:message => "Usted ingresar un sexo"}
  validates :job_title, :presence => {:message => "Usted ingresar un oficio"}
  validates :city_id, :presence => {:message => "Indique donde la ciudad donde reside"}

  validates_uniqueness_of :city_id, scope: [:name, :last_name, :birth_date], :message => "La persona esta registrada"


  def name_with_last_name
    "#{name} #{last_name}"
  end
end
