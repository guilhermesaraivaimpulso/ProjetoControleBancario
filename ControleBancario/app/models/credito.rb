class Credito < ApplicationRecord
  belongs_to :cartao
  validate :limite_maximo
  after_validation :debitar_credito

  def limite_maximo
    errors.add :base, "Valor Limite Alcançado" if resultado_limite_atual<0
  end

  def debitar_credito
    cartao.limite_atual -= valor_creditado
    cartao.save 
  end

  def resultado_limite_atual
    return cartao.limite_atual - valor_creditado
  end
end
