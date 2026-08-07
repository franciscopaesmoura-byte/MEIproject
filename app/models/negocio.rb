class Negocio < ApplicationRecord
  belongs_to :user
  has_many :servicos, dependent: :destroy
  has_many :agendamentos, dependent: :destroy
  has_many :custos, dependent: :destroy

  validates :nome, presence: true
  validates :categoria, presence: true
end