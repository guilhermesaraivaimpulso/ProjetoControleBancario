class AddLimiteToCartoes < ActiveRecord::Migration[5.0]
  def change
    add_column :cartoes, :limite, :float
  end
end
