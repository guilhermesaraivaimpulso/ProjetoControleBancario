class Usuario < ApplicationRecord
  has_many :cartoes
  has_many :debitos
  has_many :mensagens

  def self.validar_login(login, senha)
    Usuario.where(login: login, senha: senha).try(:take)
  end
  validates :nome, presence: { message: "Nome não pode ser vazio !" }
  validates :login, presence: { message: "Login não pode ser vazio !" }
  validates :senha, presence: { message: "Senha não pode ser vazia !" }
  validates :limite_ce, presence: { message: "Limite não pode ser vazio !" }, numericality: { greater_than: 99, message: "Limite deve ser ao menos 100 !" }

end
