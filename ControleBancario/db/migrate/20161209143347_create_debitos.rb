class CreateDebitos < ActiveRecord::Migration[5.0]
  def change
    create_table :debitos do |t|
      t.references :usuario, foreign_key: true
      t.integer :valor_debitado
      t.string :tipo_de_debito
      t.string :local

      t.timestamps
    end
  end
end
