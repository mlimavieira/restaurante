class Restaurante < ActiveRecord::Base

  has_many :qualificacoes
  has_and_belongs_to_many :pratos
  has_many :comentarios, :as => :comentavel

  validates_presence_of(:nome, :message=>"O campo nome deve ser preenchido")
  validates_presence_of(:endereco, :message=>"O campo endereco deve ser preenchido")  
  validates_presence_of(:especialidade, :message=>"O campo especialidade deve ser preenchido")    
  validates_uniqueness_of(:nome, :message=> "Nome ja cadastrado")
  validates_uniqueness_of(:endereco, :message=>"Endereco ja cadastrado")
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
