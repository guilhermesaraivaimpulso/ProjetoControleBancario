class AddStatusToMensagens < ActiveRecord::Migration[5.0]
  def change
    add_column :mensagens, :status, :boolean
  end
end
