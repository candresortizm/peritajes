require 'test_helper'

class ConcessionairesControllerTest < ActionDispatch::IntegrationTest

  test "Redirección al loggin si no stá loggeado como super usuario al ir al listado de concesionarios" do
    get concessionaires_index_path
    assert_redirected_to new_user_session_path
  end

  test "Validación del método de crear concesionario sin nit" do
    sign_in SuperUser.last
    post create_concessionaire_url(
            concessionaire:{
              name:"Concesionario Nuevo",
              address:"Calle 124",
              telephone:"4567899",
              concessionaire_admins_attributes:[
                {
                  email:"email@falso.com",
                  password:"password",
                  password_confirmation: "password"}]})
    assert_equal 'La validación falló: Nit no puede estar en blanco', flash[:danger]
  end

  test "Creación de un concesionario exitosamente" do
    sign_in SuperUser.last
    assert_difference "Concessionaire.count" do
      post create_concessionaire_url(
        concessionaire:{
          name:"Consesionario nuevo",
          address:"Carrera 68 No. 45 -05",
          telephone:"4567899",
          nit:"778984564",
          concessionaire_admins_attributes:[
            {
              email: "admin@nuevoconcesionario.com",
              password:"password",
              password_confirmation: "password"}]})
    end
    assert_redirected_to concessionaires_index_path
  end

end
