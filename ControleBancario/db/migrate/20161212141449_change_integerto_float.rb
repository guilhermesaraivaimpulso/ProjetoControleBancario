class ChangeIntegertoFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :usuarios, :limite_ce, :float
    change_column :debitos, :valor_debitado, :float
    change_column :creditos, :valor_creditado, :float
  end
end
