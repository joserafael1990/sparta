class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :password, :presence => {:message => "Usted debe ingresar la contraseña"}, length: {minimum: 6, maximum: 50, :message => "La contraseña debe tener al menos caracteres"}
  validates :email, :presence => {:message => "Usted ingresar un email"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
