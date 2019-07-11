require 'test_helper'

class CarProcessesControllerTest < ActionDispatch::IntegrationTest

  test "Creación de documentación por parte de un tramitador" do
    sign_in Dispatcher.last
    assert_difference "CarProcess.count" do
      post create_car_process_path(
            car_process:{
              process_type: "buy",
              state:"open",
              car_id: Car.last.id,
              dispatcher_id: Dispatcher.last.id
              }
          )
    end
    assert_redirected_to car_processes_index_path
  end

end
