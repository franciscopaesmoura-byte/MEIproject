class CreateCustos < ActiveRecord::Migration[8.1]
  def change
    create_table :custos do |t|
      t.references :negocio, null: false, foreign_key: true
      t.references :servico, null: true, foreign_key: true
      t.integer :tipo, null: false, default: 0
      t.string :descricao
      t.decimal :valor, precision: 10, scale: 2, null: false
      t.date :data, null: false

      t.timestamps
    end
  end
end