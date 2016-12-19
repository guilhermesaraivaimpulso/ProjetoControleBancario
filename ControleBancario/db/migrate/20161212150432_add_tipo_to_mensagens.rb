class AddTipoToMensagens < ActiveRecord::Migration[5.0]
  def change
    add_column :mensagens, :tipo, :string
  end
end
