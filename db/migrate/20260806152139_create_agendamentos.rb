class CreateAgendamentos < ActiveRecord::Migration[8.1]
  def change
    create_table :agendamentos do |t|
      t.references :negocio, null: false, foreign_key: true
      t.references :servico, null: false, foreign_key: true
      t.string :cliente_nome
      t.datetime :data_hora
      t.integer :status
      t.text :observacao

      t.timestamps
    end
  end
end
