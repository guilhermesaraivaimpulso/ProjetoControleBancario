class CartoesController < ApplicationController
  before_action :verificar_login
  before_action :set_cartao , only: [:show]

  def new
    @cartao = Cartao.new
    @usuario = usuario_atual
  end

  def create
    @cartao = Cartao.new(cartao_params.merge({ usuario_id: session[:usuario_id], limite_atual: cartao_params[:limite] }))
    if @cartao.save
      redirect_to @cartao
    else
      render new_cartao_path
    end
  end

  def show
    
  end

  private

    def cartao_params
      params.require(:cartao).permit(:nome,:limite,:tipo_cartao)
    end

    def set_cartao
      @cartao = Cartao.find(params[:id])
    end
end