class User < ApplicationRecord
  has_many :negocios, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end