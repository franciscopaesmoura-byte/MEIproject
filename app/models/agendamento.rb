class Agendamento < ApplicationRecord
  belongs_to :negocio
  belongs_to :servico
  has_many_attached :documentos

  enum :status, { agendado: 0, concluido: 1, cancelado: 2 }, default: :agendado

  validates :cliente_nome, presence: true
  validates :data_hora, presence: true
end