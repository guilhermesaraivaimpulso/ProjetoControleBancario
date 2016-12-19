class CreditosController < ApplicationController
  before_action :verificar_login

  def new
    @credito = Credito.new
  end

  def create
    @credito = Credito.new(credito_params)
    if @credito.save
      redirect_to @credito.cartao
    else
      render new_credito_path
    end
  end

  private
    def credito_params
      params.require(:credito).permit(:local, :valor_creditado, :cartao_id)
    end
end