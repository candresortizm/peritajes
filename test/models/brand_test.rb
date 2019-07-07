require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  test "Validación de unicidad de nit en la tabla brands" do
    new_brand = Brand.new(name:"ConcesionarioXYZ",address:"Calle 26 No. 23 - 65",nit: brands(:concesionariox).nit)
    assert_not new_brand.save, "Validación de unicidad de nit OK"
  end
end
