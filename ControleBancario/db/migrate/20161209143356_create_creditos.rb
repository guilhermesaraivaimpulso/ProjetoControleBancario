class CreateCreditos < ActiveRecord::Migration[5.0]
  def change
    create_table :creditos do |t|
      t.references :cartao, foreign_key: true
      t.integer :valor_creditado
      t.string :local

      t.timestamps
    end
  end
end
