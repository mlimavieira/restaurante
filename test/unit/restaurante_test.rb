require 'test_helper'

class RestauranteTest < ActiveSupport::TestCase
  
  test "Nao deve gravar restaurantes sem nome" do
    r = Restaurante.new
    assert_equal false, r.save
  end

  test "deve informar atravez de msg que nome e obrigatorio" do
    r=Restaurante.new
    r.save
    #nao usar este teste pois e totalmente errado
    assert_equal "deve ser preenchido", r.errors.on(:nome).first
  end

end
