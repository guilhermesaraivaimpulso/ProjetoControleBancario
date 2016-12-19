class AddSaldoAtualToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :saldo_total, :float
  end
end
