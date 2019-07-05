require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  test "should not save article without title" do
    article = Brand.new(address:"Hola mundo")
    assert_not article.save, "Se espera que no guarde un Concesionario sin nombre"
  end
end
