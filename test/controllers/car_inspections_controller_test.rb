require 'test_helper'

class CarInspectionsControllerTest < ActionDispatch::IntegrationTest

  test "Creación de un peritaje por parte de un perito" do
    sign_in CarExpert.last
    assert_difference "CarInspection.count" do
      post create_car_inspection_url(
        car_inspection:{
          owner: "Persona Dueña",
          kilometraje: "15400",
          car_expert_id: CarExpert.last.id,
          car_id: Car.last.id
        }
      )
    end
    assert_redirected_to edit_car_inspection_path(CarInspection.last)
  end

  test "Creación de un peritaje con carro nuevo en la plataforma" do
    sign_in CarExpert.last
    assert_difference  [ 'Car.count', 'CarInspection.count' ]  do
      post create_car_inspection_url(
              car_inspection:{
                owner: "Persona Dueña",
                kilometraje: "15400",
                car_expert_id: CarExpert.last.id,
                car_attributes:{
                  color: "Rojo",
                  car_brand_id: CarBrand.find_by(name:"Jeep").id,
                  model: "Wrangler Sport",
                  year: 2016,
                  vin: "DS55D6SF4SDF65SDF4",
                  plate: "AEI487",
                  car_type_id: CarType.first
                }
              })
    end
    assert_redirected_to edit_car_inspection_path(CarInspection.last)
  end

  # test "Continuación de diligenciamiento de un peritaje" do
  #   sign_in CarExpert.last
  #   get edit_car_inspection_path(car_inspections: CarInspection.last.id)
  #   car_inspection = CarInspection.last
  #   binding.pry
  #   assert_difference "Car.count" do
  #     post create_car_inspection_url(
  #             car_inspection:{
  #               owner: "Persona Dueña",
  #               kilometraje: "15400",
  #               car_expert_id: CarExpert.last.id,
  #               car_attributes:{
  #                 color: "Rojo",
  #                 car_brand_id: CarBrand.find_by(name:"Jeep").id,
  #                 model: "Wrangler Sport",
  #                 year: 2016,
  #                 vin: "DS55D6SF4SDF65SDF4",
  #                 plate: "AEI487",
  #                 car_type_id: CarType.first
  #               }
  #             })
  #   end
  #   assert_redirected_to edit_car_inspection_path(CarInspection.last)
  # end

end
