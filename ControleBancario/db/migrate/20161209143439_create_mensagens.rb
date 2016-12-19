class CreateMensagens < ActiveRecord::Migration[5.0]
  def change
    create_table :mensagens do |t|
      t.references :usuario, foreign_key: true
      t.string :msg

      t.timestamps
    end
  end
end
