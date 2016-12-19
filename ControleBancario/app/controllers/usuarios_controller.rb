class UsuariosController < ApplicationController
  before_action :verificar_login, only: [:show]
  before_action :atualiza_valor_total, only: [:show]
  
  def new
    @usuario = Usuario.new
  end

  def create
    if usuario_params[:senha] == usuario_params[:senha_confirm]
      @usuario = Usuario.new(usuario_params.except(:senha_confirm))
      if @usuario.save
        flash[:notice] = "Usuário criado."
        redirect_to '/home/index'
      else
        render new_usuario_path
      end
    else
      flash[:alert] = "Senha e confirmação de senha devem ser iguais !"
      redirect_to new_usuario_path
    end
  end

  def show
    @usuario = usuario_atual
    @mensagens = Mensagem.where(usuario: @usuario.id, status: false)
  end

  def edit
    @usuario = usuario_atual
  end

  def update
    if usuario_params[:senha] == usuario_params[:senha_confirm]
      @usuario = Usuario.update(usuario_params.except(:senha_confirm))
      if @usuario.save
        redirect_to nome_index_path
      else
        render edit_usuario_path(@usuario)
      end
    else
      flash[:alert] = "Senha e confirmação de senha devem ser iguais !"
      redirect_to new_usuario_path
    end
  end

  private

    def usuario_params
      params.require(:usuario).permit(:nome, :cpf, :endereco, :login, :senha, :senha_confirm, :limite_ce, :saldo_total)
    end

end