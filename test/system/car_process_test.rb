require "application_system_test_case"

class CarProcessTest < ApplicationSystemTestCase
  test "Creación de un proceso de documentación" do
    visit new_user_session_path
    assert_selector "h2", text: "Iniciar sesión"
    fill_in "Correo electrónico", with: "dispatcher@concesionariox.com"
    fill_in "Contraseña", with: 'password'
    click_button 'Iniciar sesión'
    assert_selector '.wrapper h1', text:"Procesos de documentación"
    click_link 'Nuevo proceso'
    fill_in "plate", with:"ABC654"
    click_button 'Buscar'
    assert_selector '.wrapper h1', text:"Nuevo proceso de documentación"
    fill_in "car_process_car_attributes_color", with:"Negro ebony"
    find('#car_process_car_attributes_car_type_id').find(:xpath, 'option[2]').select_option
    find('#car_process_car_attributes_car_brand_id').find(:xpath, 'option[2]').select_option
    fill_in "car_process_car_attributes_model", with:"Aveo"
    fill_in "car_process_car_attributes_year", with:"2016"
    fill_in "car_process_car_attributes_vin", with:"KJHSDLKJH654654"
    click_button 'Finalizar'
    assert_no_select ("#car_process_state")
    find('#car_process_state').find(:xpath, 'option[2]').select_option
    click_button 'Finalizar'
    assert_selector '.wrapper h1', text:"Procesos de documentación"
    click_link 'Venta'
    assert_text('ABC654')
  end
  
end
