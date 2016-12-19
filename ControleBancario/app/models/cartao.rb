class Cartao < ApplicationRecord
  belongs_to :usuario
  has_many :creditos

  validates :nome, presence: { message: "Nome não pode ser vazio !" }
  validates :limite, presence: { message: "Limite não pode ser vazio !" }, numericality: { greater_than: 0, message: "Limite deve ser um número maior que zero !" }
end
