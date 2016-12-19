class AddLimiteAtualToCartoes < ActiveRecord::Migration[5.0]
  def change
    add_column :cartoes, :limite_atual, :float
  end
end
