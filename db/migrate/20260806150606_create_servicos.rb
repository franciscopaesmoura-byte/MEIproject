class CreateServicos < ActiveRecord::Migration[8.1]
  def change
    create_table :servicos do |t|
      t.references :negocio, null: false, foreign_key: true
      t.string :nome
      t.string :categoria
      t.integer :tempo_estimado_minutos
      t.decimal :custo_direto, precision: 10, scale: 2
      t.decimal :custo_fixo_rateado, precision: 10, scale: 2
      t.decimal :valor_hora, precision: 10, scale: 2
      t.decimal :percentual_imprevisto, precision: 5, scale: 2
      t.decimal :percentual_margem, precision: 5, scale: 2
      t.decimal :preco_calculado, precision: 10, scale: 2
      t.decimal :preco_final, precision: 10, scale: 2
      t.text :descricao

      t.timestamps
    end
  end
end
