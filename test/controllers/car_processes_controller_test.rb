require 'test_helper'

class CarProcessesControllerTest < ActionDispatch::IntegrationTest

  test "Creación de documentación con carro preexistente por parte de un tramitador" do
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

  test "Creación de documentación sin carro preexistente" do
    sign_in Dispatcher.last
    assert_difference [ 'Car.count', 'CarProcess.count' ] do
      post create_car_process_path(
            car_process:{
              process_type: "buy",
              state:"open",
              car_attributes:{
                color: "Rojo",
                car_brand_id: CarBrand.find_by(name:"Jeep").id,
                model: "Wrangler Sport",
                year: 2016,
                vin: "DS55D6SF4SDF65SDF4",
                plate: "AEI487",
                car_type_id: CarType.first
              },
              dispatcher_id: Dispatcher.last.id
              }
          )
    end
    assert_redirected_to car_processes_index_path
  end

end
