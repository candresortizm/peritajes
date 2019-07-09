require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest

  test "Redirección al loggin si no stá loggeado como super usuario al ir al listado de concesionarios" do
    get brands_index_path
    assert_redirected_to new_user_session_path
  end

  test "Validación del método de crear concesionario sin nit" do
    sign_in users(:super)
    post create_brand_url(
            brand:{
              name:"Concesionario Nuevo",
              address:"Calle 124",
              telephone:"4567899",
              brand_admins_attributes:[
                {
                  email:"email@falso.com",
                  password:"password",
                  password_confirmation: "password"}]})
    assert_equal 'La validación falló: Nit no puede estar en blanco', flash[:danger]
  end

  test "Creación de un concesionario exitosamente" do
    sign_in users(:super)
    assert_difference "Brand.count" do
      post create_brand_url(
        brand:{
          name:"Consesionario nuevo",
          address:"Carrera 68 No. 45 -05",
          telephone:"4567899",
          nit:"778984564",
          brand_admins_attributes:[
            {
              email: "admin@nuevoconcesionario.com",
              password:"password",
              password_confirmation: "password"}]})
    end
    assert_redirected_to brands_index_path
  end

end
