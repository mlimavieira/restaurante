class RestaurantesController < ApplicationController
 
  def index
#   @restaurantes = Restaurante.all
#   @restaurantes = Restaurante.find (:all, :order => "nome")    

    @restaurantes = Restaurante.paginate :page => params['page'], :per_page=>3
  end
  
  def show 
    @restaurante = Restaurante.find(params[:id])
  end

  def new 
    nome = params[:nome]
    endereco = params[:endereco]
    especialidade = params[:especialidade]
    @restaurante = Restaurante.new

    @restaurante.nome = nome
    @restaurante.endereco = endereco
    @restaurante.especialidade = especialidade

    puts nome
  end

  def create 
    @restaurante = Restaurante.new(params[:restaurante])
    if @restaurante.save 
       redirect_to (:action=>"show", :id=>@restaurante)
    else
       render :action=>"new"
    end
  end

  def edit 
    @restaurante = Restaurante.find(params[:id])
  end

  def update 
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes (params[:restaurante])
       redirect_to (:action=> "show", :id=>@restaurante)
    else
       render :action=>"edit"
    end
  end
  
  def destroy 
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    
    redirect_to(:action=>"index")
  end
end
