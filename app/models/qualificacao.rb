class Qualificacao < ActiveRecord::Base

  belongs_to :restaurante
  belongs_to :cliente
  has_many :comentarios, :as => :comentavel

  validates_presence_of :nota, :message=> " - Deve ser preenchido"
  validates_presence_of :valor_gasto, :message=> " - Deve ser preenchido"
  validates_presence_of :cliente_id, :message=> " - Deve ser preenchido"
  validates_presence_of :restaurante_id, :message=> " - Deve ser preenchido"


end
