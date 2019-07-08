require "application_system_test_case"

class BenchmarksTest < ApplicationSystemTestCase
  test "Creación de un peritaje por parte de un perito" do
    visit new_user_session_path
    assert_selector "h2", text: "Iniciar sesión"
    fill_in "Correo electrónico", with: users(:perito).email
    fill_in "Contraseña", with: 'password'
    # page.execute_script("$('.actions input').click()")
    click_button 'Iniciar sesión'
    assert_selector '.index_benchmarks h1', text:"Peritajes"
    click_link 'Nuevo peritaje'
    fill_in "plate", with:"VBN654"
    click_button 'Buscar'
    assert_selector '.wrapper h1', text:"Nuevo peritaje"
    fill_in "car_inspection_owner", with:"VBN654"
    fill_in "car_inspection_kilometraje", with:"VBN654"
    fill_in "car_inspection_color", with:"VBN654"
    page.execute_script("$('#car_inspection_car_attributes_car_type_id').val(2)")
    fill_in "car_inspection_car_attributes_car_brand", with:"Chevrolet"
    fill_in "car_inspection_car_attributes_model", with:"Aveo"
    fill_in "car_inspection_car_attributes_year", with:"2016"
    fill_in "car_inspection_car_attributes_vin", with:"KJHSDLKJH654654"
    click_button 'Continuar'
    fill_in "car_inspection_inspection_comments_attributes_0_comment", with:"Este es un comentario para accesorios"
    click_button 'Continuar'
    for i in 1..8
      using_wait_time 10 do
        fill_in "car_inspection_inspection_comments_attributes_0_comment", with: "Este es un comentario para la siguiente #{i}"
        page.execute_script(
          "
          setTimeout(function(){
            var radio_queries = document.querySelectorAll('.tab-pane.active .radio_button');
            for(var i=0; i < radio_queries.length; i++){
              elements = document.querySelectorAll(\".tab-pane.active input[type='radio'][name='car_inspection[car_answers_attributes][\"+i+\"][answer]']\");
              if(elements.length>0){
                switch (elements[0].getAttribute('data-question-type')) {
                  case 'range':
                    elements[2].checked=true;
                    break;
                    case 'yes_or_no':
                      case 'good_bad':
                        case 'yes_no_na':
                          case 'good_bad_na':
                            elements[0].checked=true;
                            break;
                          }
                        }
                      }
            document.querySelector(.tab-pane.active input[type='submit']).click()
          }, 3000);
          "
        )
        click_button 'Continuar'
      end
    end
  end

end
