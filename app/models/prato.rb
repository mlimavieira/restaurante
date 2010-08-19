class Prato < ActiveRecord::Base
  validates_presence_of :nome, :message=> " - Deve ser preenchido"
  validates_uniqueness_of :nme , :message=> " - Nome ja cadastrado"

  has_and_belongs_to_many :restaurantes
  has_one :receita

end
