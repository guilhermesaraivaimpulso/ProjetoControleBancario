class HomeController < ApplicationController
  def index
    @usuario = Usuario.new
  end

  def login
    if @usuario = Usuario.validar_login(usuario_params[:login], usuario_params[:senha])
      session[:usuario_id] = @usuario.id
      session[:usuario_nome] = @usuario.nome
      session[:saldoAtual] = @usuario.saldo_total
      redirect_to @usuario
    else
      flash[:alert] = "Acesso negado. Login ou senha incorretos."
      redirect_to '/home/index'
    end
  end
  def logoff
    session[:usuario_id] = nil
    session[:usuario_nome] = nil
    session[:saldoAtual] = nil
    redirect_to home_index_path
  end

  private

    def usuario_params
      params.require(:usuario).permit(:nome, :cpf, :endereco, :login, :senha, :limite_ce)
    end
end