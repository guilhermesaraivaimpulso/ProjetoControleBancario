class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def verificar_login
    redirect_to home_index_path if session[:usuario_id] == nil
  end
  def usuario_atual
    if session[:usuario_id]
      Usuario.find(session[:usuario_id])
    end
  end
  def atualiza_valor_total
    session[:saldoAtual] = Usuario.find(session[:usuario_id]).saldo_total
    puts "-------------- SALDO ATUAL -----------> #{session[:saldoAtual]}"
  end
end
