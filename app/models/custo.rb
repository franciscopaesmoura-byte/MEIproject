class Custo < ApplicationRecord
  belongs_to :negocio
  belongs_to :servico, optional: true
  has_many_attached :documentos

  enum :tipo, { fixo: 0, variavel: 1 }, default: :variavel

  validates :descricao, presence: true
  validates :valor, numericality: { greater_than: 0 }
  validates :data, presence: true
end