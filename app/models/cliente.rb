class Cliente < ActiveRecord::Base
  has_many :qualificacoes

  validates_presence_of :nome, :message=> " - Deve ser preenchido"
  validates_uniqueness_of :nome , :message=> " - Nome ja cadastrado"
  validates_numericality_of :idade , :greater_than=>0, :less_than=>100, :message=> " - Deve ser um numero entre 0 e 100"

  validate :primeira_letra_maiuscula

  private 
    def primeira_letra_maiuscula
      unless nome 
      	unless /^[A-Z].*/ =~ nome
	  errors.add(:nome, "A primeira letra deve ser Maiuscula")
        end
      end
    end

end
