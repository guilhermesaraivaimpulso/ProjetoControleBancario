class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :cpf
      t.string :endereco
      t.string :login
      t.string :senha
      t.integer :limite_ce

      t.timestamps
    end
  end
end
