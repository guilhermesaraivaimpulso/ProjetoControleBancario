class Debito < ApplicationRecord
  belongs_to :usuario
  validates :valor_debitado, presence: { message: "Valor não pode ser vazio !" }, numericality: { greater_than: 0, message: "Valor deve ser um número maior que zero !" }
  validates :local, presence: { message: "Nome não pode ser vazio !" }
  before_save :valor_limite_ce
  before_save :atualiza_saldo_total_usuario

  def atualiza_saldo_total_usuario
    usuario.saldo_total = valor_final
    usuario.save
  end
  def valor_limite_ce
    soma = usuario.limite_ce+valor_final
    if soma<0
      errors.add :base, "Valor Limite Alcançado"
    end
  end
  def valor_final
    qnt = valor_debitado
    qnt = (qnt*(-1)) if tipo_de_debito == "Retirada"
    return usuario.saldo_total + qnt
  end

end
