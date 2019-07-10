require 'test_helper'

class ConcessionaireTest < ActiveSupport::TestCase

  test "Validación de unicidad de nit en la tabla concessionaires" do
    new_concessionaire = Concessionaire.new(name:"ConcesionarioXYZ",address:"Calle 26 No. 23 - 65",nit: "123456456")
    assert_not new_concessionaire.save, "Validación de unicidad de nit OK"
  end
end
