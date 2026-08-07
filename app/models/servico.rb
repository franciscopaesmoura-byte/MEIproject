class Servico < ApplicationRecord
  belongs_to :negocio
  has_many :agendamentos, dependent: :nullify
  has_many :custos, dependent: :nullify
  has_many_attached :documentos

  validates :nome, presence: true
  validates :tempo_estimado_minutos, numericality: { greater_than: 0 }
  validates :custo_direto, :custo_fixo_rateado, :valor_hora,
            numericality: { greater_than_or_equal_to: 0 }
  validates :percentual_imprevisto, :percentual_margem,
            numericality: { greater_than_or_equal_to: 0, less_than: 100 }

  # Implementa a fórmula que desenhamos:
  # Preço = (custo direto + custo fixo rateado + mão de obra) × (1 + imprevisto) ÷ (1 − margem)
  def calcular_preco_sugerido
    mao_de_obra = valor_hora.to_f * (tempo_estimado_minutos.to_f / 60)
    subtotal = custo_direto.to_f + custo_fixo_rateado.to_f + mao_de_obra
    subtotal_com_imprevisto = subtotal * (1 + percentual_imprevisto.to_f / 100)
    subtotal_com_imprevisto / (1 - percentual_margem.to_f / 100)
  end

  def breakdown_calculo
    mao_de_obra = valor_hora.to_f * (tempo_estimado_minutos.to_f / 60)
    {
      custo_direto: custo_direto.to_f,
      custo_fixo_rateado: custo_fixo_rateado.to_f,
      mao_de_obra: mao_de_obra.round(2),
      imprevisto_valor: ((custo_direto.to_f + custo_fixo_rateado.to_f + mao_de_obra) * (percentual_imprevisto.to_f / 100)).round(2),
      preco_sugerido: calcular_preco_sugerido.round(2)
    }
  end
end