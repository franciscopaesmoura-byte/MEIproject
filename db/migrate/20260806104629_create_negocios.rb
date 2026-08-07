class CreateNegocios < ActiveRecord::Migration[8.1]
  def change
    create_table :negocios do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.string :categoria

      t.timestamps
    end
  end
end
