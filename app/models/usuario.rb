class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  # Password pode ser acessado pelo nome senha
  alias_attribute :senha, :password
end
