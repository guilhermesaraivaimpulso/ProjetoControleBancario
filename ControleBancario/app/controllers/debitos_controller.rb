class DebitosController < ApplicationController
  before_action :verificar_login
  before_action :atualiza_valor_total

  def new
    @debito = Debito.new
    @usuario = usuario_atual
  end
  def create
    usuario = Usuario.find(debito_params[:usuario_id])
    puts "----------- SALTDO Q TO ADICIONADO -------> #{session[:saldoAtual]}"
    @debito = Debito.new(debito_params.merge({ saldo_total: session[:saldoAtual] }))
    if @debito.save
      redirect_to usuario
    else
      render new_debito_path
    end
  end
  private
    def debito_params
      params.require(:debito).permit(:local, :valor_debitado, :tipo_de_debito, :usuario_id)
    end
end