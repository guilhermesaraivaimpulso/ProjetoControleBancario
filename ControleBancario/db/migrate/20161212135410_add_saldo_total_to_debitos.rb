class AddSaldoTotalToDebitos < ActiveRecord::Migration[5.0]
  def change
    add_column :debitos, :saldo_total, :float
  end
end
