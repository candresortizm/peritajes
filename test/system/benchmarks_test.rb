require "application_system_test_case"

class BenchmarksTest < ApplicationSystemTestCase
  test "Creación de un peritaje por parte de un perito" do
    visit new_user_session_path
    assert_selector "h2", text: "Iniciar sesión"
    fill_in "Correo electrónico", with: users(:perito).email
    fill_in "Contraseña", with: 'password'
    click_button 'Iniciar sesión'
    assert_selector '.index_benchmarks h1', text:"Peritajes"
    click_link 'Nuevo peritaje'
    fill_in "plate", with:"VBN654"
    click_button 'Buscar'
    assert_selector '.wrapper h1', text:"Nuevo peritaje"
    fill_in "car_inspection_owner", with:"Persona Dueña"
    fill_in "car_inspection_kilometraje", with:"15400"
    fill_in "car_inspection_color", with:"Negro ebony"
    page.execute_script("$('#car_inspection_car_attributes_car_type_id').val(2)")
    fill_in "car_inspection_car_attributes_car_brand", with:"Chevrolet"
    fill_in "car_inspection_car_attributes_model", with:"Aveo"
    fill_in "car_inspection_car_attributes_year", with:"2016"
    fill_in "car_inspection_car_attributes_vin", with:"KJHSDLKJH654654"
    click_button 'Continuar'
    for i in 1..6
      sleep 0.5
      page.execute_script(
        "
          document.querySelector(\".tab-pane.active #car_inspection_inspection_comments_attributes_0_comment\").value=\"Este es un comentario para la Categoría #{i}\";
          var radio_queries = document.querySelectorAll('.tab-pane.active .radio_button');
          for(var i=0; i < radio_queries.length; i++){
            radio_answers = document.querySelectorAll(\".tab-pane.active input[type='radio'][name='car_inspection[car_answers_attributes][\"+i+\"][answer]']\");
            if(radio_answers.length>0){
              switch (radio_answers[0].getAttribute('data-question-type')) {
                case 'range':
                  radio_answers[2].checked=true;
                  break;
                case 'yes_or_no':
                case 'good_bad':
                case 'yes_no_na':
                case 'good_bad_na':
                  radio_answers[0].checked=true;
                  break;
              }
            }
            var text_element=document.querySelector(\".tab-pane.active input[type='text'][name='car_inspection[car_answers_attributes][\"+i+\"][answer]']\");
            if(text_element!=null){
              text_element.value = 5;
            }
          }
        "
      )
      sleep 0.5
      click_button 'Continuar'
    end
    attach_file('car_inspection_photo_front', Rails.root + 'test/resources/Frente.png')
    attach_file('car_inspection_photo_right', Rails.root + 'test/resources/Derecha.png')
    attach_file('car_inspection_photo_back', Rails.root + 'test/resources/Atras.png')
    attach_file('car_inspection_photo_left', Rails.root + 'test/resources/Izquierda.png')
    attach_file('car_inspection_photo_motor', Rails.root + 'test/resources/Motor.png')
    attach_file('car_inspection_photo_inside', Rails.root + 'test/resources/Interior.png')
    click_button 'Continuar'
    # assert_selector '.index_benchmarks h1', text:"Peritajes"
    assert_text('Persona Dueña')
  end
end
