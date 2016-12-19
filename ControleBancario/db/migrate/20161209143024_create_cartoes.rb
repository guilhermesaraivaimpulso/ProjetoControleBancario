class CreateCartoes < ActiveRecord::Migration[5.0]
  def change
    create_table :cartoes do |t|
      t.references :usuario, foreign_key: true
      t.string :nome
      t.string :tipo_cartao

      t.timestamps
    end
  end
end
