SuperUser.create(email: "super@admin.com", password: "password", password_confirmation: "password")

Concessionaire.create(name: "Concesionario X", address: "Av 76 # 32 -45", telephone: "7429249",nit: "123456456")

ConcessionaireAdmin.create(email: "admin@concesionariox.com", password: "password", password_confirmation: "password",concessionaire_id:Concessionaire.find_by(nit:"123456456").id)

CarExpert.create(email: "car_expert@concesionariox.com", password: "password", password_confirmation: "password",concessionaire_id:Concessionaire.find_by(nit:"123456456").id)

Dispatcher.create(email: "dispatcher@concesionariox.com", password: "password", password_confirmation: "password",concessionaire_id:Concessionaire.find_by(nit:"123456456").id)

QuestionCategory.create(name:"Motor",order_category: 1)
QuestionCategory.create(name:"Interior",order_category: 2)
QuestionCategory.create(name:"Exterior",order_category: 3)
QuestionCategory.create(name:"Parte baja",order_category: 4)
QuestionCategory.create(name:"Alineación y llantas",order_category: 5)
QuestionCategory.create(name:"Accesorios",order_category: 6)

CarType.new(name:"SUV").save!
CarType.new(name:"Hatchback").save!
CarType.new(name:"Sedan").save!


CarBrand.new(name:"Audi").save!
CarBrand.new(name:"BMW").save!
CarBrand.new(name:"Chevrolet").save!
CarBrand.new(name:"Citroen").save!
CarBrand.new(name:"Dodge").save!
CarBrand.new(name:"Fiat").save!
CarBrand.new(name:"Ford").save!
CarBrand.new(name:"Honda").save!
CarBrand.new(name:"Hyundai").save!
CarBrand.new(name:"Jeep").save!
CarBrand.new(name:"Kia").save!
CarBrand.new(name:"Land Rover").save!
CarBrand.new(name:"Mazda").save!
CarBrand.new(name:"Mercedes Benz").save!
CarBrand.new(name:"Mazda").save!
CarBrand.new(name:"Mitsubishi").save!
CarBrand.new(name:"Mini").save!
CarBrand.new(name:"Nissan").save!
CarBrand.new(name:"Peugeot").save!
CarBrand.new(name:"Renault").save!
CarBrand.new(name:"Skoda").save!
CarBrand.new(name:"Ssangyong").save!
CarBrand.new(name:"Subaru").save!
CarBrand.new(name:"Susuki").save!
CarBrand.new(name:"Volkswagen").save!
CarBrand.new(name:"Volvo").save!

Car.new(
  car_brand_id: CarBrand.find_by(name:"Renault").id,
  model: "Captiva",
  year: "2015",
  plate: "AGH456",
  vin: "KJ32Y4234I234J",
  car_type_id: CarType.find_by(name:"Sedan").id,
  color: "Rojo"
).save!

Question.create([
#MOTOR
  { key: "immediate_startup", text_query: "Encendido inmediato", question_category_id: 1, question_type: "good_bad", order_question: 1, points: 55 },
  { key: "on_warm_up", text_query: "Durante calentamiento", question_category_id: 1, question_type: "range", order_question: 2, points: 10 },
  { key: "tachometer", text_query: "Funcionamiento del tacómetro", question_category_id: 1, question_type: "good_bad", order_question: 3, points: 15 },
  { key: "engine_vibration", text_query: "Motor sin vibraciones anormales", question_category_id: 1, question_type: "yes_or_no", order_question: 4, points: 55 },
  { key: "abnormal_noises_on_engine", text_query: "Motor sin ruidos anormales", question_category_id: 1, question_type: "yes_or_no", order_question: 5, points: 55 },
  { key: "startup_function", text_query: "Funcionamiente del arranque", question_category_id: 1, question_type: "good_bad", order_question: 6, points: 55 },
  { key: "transmission_noises", text_query: "No presenta ruidos en transmisión", question_category_id: 1, question_type: "yes_or_no", order_question: 7, points: 55 },
  { key: "gearbox_noises", text_query: "No presenta ruidos en caja", question_category_id: 1, question_type: "yes_or_no", order_question: 8, points: 55 },
  { key: "steering_wheel", text_query: "Operación del volante de extremo a extremo", question_category_id: 1, question_type: "range", order_question: 9, points: 20 },
  { key: "steering_system_on_hot_engine_state", text_query: "Funcionamiento del sistema de dirección del motor", question_category_id: 1, question_type: "range", order_question: 10, points: 20 },
  { key: "turbo_hook", text_query: "Enganche del turbo", question_category_id: 1, question_type: "good_bad_na", order_question: 11, points: 10 },
  { key: "direction_wheel", text_query: "Volante de dirección", question_category_id: 1, question_type: "range",order_question: 12, points: 8 },
  { key: "engine_original_sealing", text_query: "Sellantes originales en motor", question_category_id: 1, question_type: "yes_or_no", order_question: 13, points: 10 },
  { key: "hoses", text_query: "Mangueras", question_category_id: 1, question_type: "range",order_question: 14, points: 10 },
  { key: "alternator_strap", text_query: "Correa de accesorios", question_category_id: 1, question_type: "range", order_question: 15, points: 10 },
  { key: "timing_belt", text_query: "Correa de repartición", question_category_id: 1, question_type: "range", order_question: 16, points: 10 },
  { key: "fluid_level", text_query: "nivel de fluidos", question_category_id: 1, question_type: "range", order_question: 17, points: 4 },
  { key: "engine_sludge", text_query: "No tiene lodos en el motor", question_category_id: 1, question_type: "yes_or_no", order_question: 18, points: 40, },
  { key: "turbo_state", text_query: "Estado del turbo", question_category_id: 1, question_type: "good_bad_na", order_question: 19, points: 10, },
#INTERIOR
  { key: "floors", text_query: "Tapetes", question_category_id: 2, question_type: "range", order_question: 1, points: 2 },
  { key: "carpet", text_query: "Alfombra", question_category_id: 2, question_type: "range", order_question: 2, points: 10 },
  { key: "cup_holders", text_query: "Portavasos", question_category_id: 2, question_type: "range", order_question: 3, points: 7 },
  { key: "upholstery", text_query: "Estado de tapicería", question_category_id: 2, question_type: "range", order_question: 4, points: 15 },
  { key: "electric_seats_state", text_query: "Estado asientos eléctricos", question_category_id: 2, question_type: "good_bad_na", order_question: 5, points: 10 },
  { key: "radio_function", text_query: "Funcionamiento de radio", question_category_id: 2, question_type: "range", order_question: 6, points: 10 },
  { key: "panel_buttons_state", text_query: "Estado botones del panel", question_category_id: 2, question_type: "range", order_question: 7, points: 10 },
  { key: "abnormal_odors", text_query: "Olores anormales", question_category_id: 2, question_type: "yes_or_no", order_question: 8, points: 8 },
  { key: "seatbelt_quantity", text_query: "Cantidad de cinturones de seguridad", question_category_id: 2, question_type: "text", order_question: 9, points: 0 },
  { key: "seatbelt_quality", text_query: "Estado de cinturones de seguridad", question_category_id: 2, question_type: "range", order_question: 10, points: 10 },
  { key: "computer_display_status", text_query: "Estado display computador", question_category_id: 2, question_type: "good_bad", order_question: 11, points: 15 },
  { key: "rearview_mirrors", text_query: "Retrovisores", question_category_id: 2, question_type: "range", order_question: 12, points: 5 },
  { key: "rearview_electric_function", text_query: "Funcionamiento retrovisores eléctricos", question_category_id: 2, question_type: "good_bad_na", order_question: 13, points: 8 },
  { key: "glove_compartment", text_query: "Guantera", question_category_id: 2, question_type: "range",order_question: 14, points: 8 },
  { key: "airbag_light_is_off", text_query: "Testigo airbags apagado", question_category_id: 2, question_type: "yes_no_na", order_question: 15, points: 20 },
  { key: "original_airbags", text_query: "Airbags Originales", question_category_id: 2, question_type: "yes_no_na", order_question: 16, points: 40 },
  { key: "number_of_airbags", text_query: "Número de airbags", question_category_id: 2, question_type: "text",order_question: 17, points: 0 },
  { key: "direction_wheel_controls", text_query: "Funcionamiento de los controles del volante", question_category_id: 2, question_type: "good_bad_na", order_question: 18, points: 8 },
  { key: "central_blocking_system", text_query: "Bloqueo central", question_category_id: 2, question_type: "good_bad_na", order_question: 19, points: 8 },
  { key: "speakers", text_query: "Parlantes", question_category_id: 2, question_type: "yes_or_no", order_question: 20, points: 8 },
  { key: "pedals", text_query: "Pedales", question_category_id: 2, question_type: "range", order_question: 21, points: 7 },
  { key: "emergency_break", text_query: "Freno de emergencia", question_category_id: 2, question_type: "range", order_question: 22, points: 10 },
  { key: "panel_frame_state", text_query: "Estado de millaré", question_category_id: 2, question_type: "range", order_question: 23, points: 8 },
  { key: "interior_lights", text_query: "Luces interiores", question_category_id: 2, question_type: "good_bad", order_question: 24, points: 7 },
  { key: "door_handles", text_query: "Manillas de las puertas", question_category_id: 2, question_type: "yes_or_no", order_question: 25, points: 10 },
  { key: "trunk_lid", text_query: "Puerta baúl", question_category_id: 2, question_type: "range", order_question: 41, points: 26 },
  { key: "top", text_query: "Techo", question_category_id: 2, question_type: "range", order_question: 27, points: 10 },
  { key: "rear_left_door_panel", text_query: "Panel puerta trasera izquierda", question_category_id: 2, question_type: "range", order_question: 28, points: 10 },
  { key: "rear_left_window_control", text_query: "Estado del elevavidrios izquierdo trasero", question_category_id: 2, question_type: "range", order_question: 29, points: 10 },
  { key: "rear_right_door_panel", text_query: "Panel puerta trasera derecha", question_category_id: 2, question_type: "range",order_question: 30, points: 10 },
  { key: "rear_right_window_control", text_query: "Estado del elevavidrios derecho trasero", question_category_id: 2, question_type: "range", order_question: 31, points: 10 },
  { key: "front_right_door_panel", text_query: "Panel interior puerta delantera derecha (elevavidrios)", question_category_id: 2, question_type: "range", order_question: 32, points: 10 },
  { key: "front_right_window_control", text_query: "Estado del elevavidrios derecho delantero", question_category_id: 2, question_type: "range", order_question: 33, points: 10 },
  { key: "front_left_door_panel", text_query: "Panel interior puerta delantera izquierda (elevavidrios)", question_category_id: 2, question_type: "range", order_question: 34, points: 10 },
  { key: "front_left_window_control", text_query: "Estado elevavidrios izquierdo delantero", question_category_id: 2, question_type: "range", order_question: 35, points: 10 },
#EXTERIOR
  { key: "capot", text_query: "Capó", question_category_id: 3, question_type: "range",order_question: 1, points: 30 },
  { key: "left_frontal_mudguard", text_query: "Guardafango delantero izquierdo", question_category_id: 3, question_type: "range", order_question: 2, points: 10 },
  { key: "chassis_left_tip_front", text_query: "Punta izquierda de chasis delantero", question_category_id: 3, question_type: "good_bad", order_question: 3, points: 30 },
  { key: "front_left_door", text_query: "Puerta delantera izquierda", question_category_id: 3, question_type: "range", order_question: 4, points: 30 },
  { key: "front_left_door_sealing", text_query: "Sellado de puertas", question_category_id: 3, question_type: "good_bad", order_question: 5, points: 10 },
  { key: "welding_points_front_door_left", text_query: "Puntos de soldadura puerta delantera izquierda", question_category_id: 3, question_type: "good_bad", order_question: 6, points: 10 },
  { key: "left_headlight", text_query: "Farola delantera izquierda", question_category_id: 3, question_type: "range", order_question: 7, points: 10 },
  { key: "left_rack", text_query: "Paral lateral izquierdo", question_category_id: 3, question_type: "good_bad", order_question: 8, points: 10 },
  { key: "left_stirrup", text_query: "Estado estribo izquierdo", question_category_id: 3, question_type: "good_bad", order_question: 9, points: 10 },
  { key: "left_back_mudguard", text_query: "Guardafango trasero izquierdo", question_category_id: 3, question_type: "range", order_question: 10, points: 8 },
  { key: "chassis_left_tip_rear", text_query: "Punta izquierda de chasis trasero", question_category_id: 3, question_type: "good_bad",order_question: 11, points: 30 },
  { key: "back_left_door", text_query: "Puerta trasera izquierda", question_category_id: 3, question_type: "range", order_question: 12, points: 30 },
  { key: "back_left_door_sealing", text_query: "Sellado de puertas", question_category_id: 3, question_type: "good_bad", order_question: 13, points: 10 },
  { key: "welding_points_back_door_left", text_query: "Puntos de soldadura puerta trasera izquierda", question_category_id: 3, question_type: "good_bad", order_question: 14, points: 10 },
  { key: "left_stoplight ", text_query: "Stop izquierdo", question_category_id: 3, question_type: "range", order_question: 15, points: 10 },
  { key: "rear_bumper", text_query: "Bumper trasero", question_category_id: 3, question_type: "range", order_question: 16, points: 20 },
  { key: "trunk_door_panel", text_query: "Panel puerta baúl", question_category_id: 3, question_type: "range", order_question: 17, points: 10 },
  { key: "rear_windshield", text_query: "Vidrio trasero", question_category_id: 2, question_type: "range", order_question: 18, points: 20 },
  { key: "turn_back_lights_button", text_query: "Direccionales traseras", question_category_id: 3, question_type: "yes_or_no", order_question: 19, points: 10 },
  { key: "plate_lights", text_query: "Luces de placas", question_category_id: 3, question_type: "yes_or_no", order_question: 20, points: 5 },
  { key: "parking_lights", text_query: "Luces de parqueo", question_category_id: 3, question_type: "yes_or_no", order_question: 21, points: 10 },
  { key: "gas_cap_state", text_query: "Estado de la tapa del tanque de combustible", question_category_id: 3, question_type: "good_bad", order_question: 22, points: 10 },
  { key: "welding_points_trunk_door", text_query: "Puntos de soldadura baúl", question_category_id: 3, question_type: "good_bad", order_question: 23, points: 10 },
  { key: "right_back_mudguard", text_query: "Guardafango trasero derecho", question_category_id: 3, question_type: "range", order_question: 24, points: 8 },
  { key: "chassis_right_tip_rear", text_query: "Punta derecha de chasis trasero", question_category_id: 3, question_type: "good_bad", order_question: 25, points: 30 },
  { key: "back_right_door", text_query: "Puerta trasera derecha", question_category_id: 3, question_type: "range", order_question: 26, points: 30 },
  { key: "back_right_door_sealing", text_query: "Sellado de puertas", question_category_id: 3, question_type: "good_bad",order_question: 27, points: 10 },
  { key: "welding_points_back_door_right", text_query: "Puntos de soldadura puerta trasera derecha", question_category_id: 3, question_type: "good_bad", order_question: 28, points: 10 },
  { key: "right_stoplight ", text_query: "Stop derecho", question_category_id: 3, question_type: "range", order_question: 29, points: 10 },
  { key: "right_rack", text_query: "Paral lateral derecho", question_category_id: 3, question_type: "good_bad",order_question: 30, points: 10 },
  { key: "right_stirrup", text_query: "Estado del estribo derecho", question_category_id: 3, question_type: "good_bad", order_question: 31, points: 10 },
  { key: "right_frontal_mudguard", text_query: "Guardafango delantero derecho", question_category_id: 3, question_type: "range", order_question: 32, points: 10 },
  { key: "chassis_right_tip_front", text_query: "Punta derecha de chasis delantero", question_category_id: 3, question_type: "good_bad", order_question: 33, points: 30 },
  { key: "front_right_door", text_query: "Puerta delantera derecha", question_category_id: 3, question_type: "range", order_question: 34, points: 30 },
  { key: "front_right_door_sealing", text_query: "Sellado de puertas", question_category_id: 5, question_type: "good_bad", order_question: 35, points: 10 },
  { key: "welding_points_front_door_right", text_query: "Puntos de soldadura puerta delantera derecha", question_category_id: 3, question_type: "good_bad", order_question: 36, points: 10 },
  { key: "right_headlight", text_query: "Farola delantera derecha", question_category_id: 3, question_type: "range", order_question: 37, points: 10 },
  { key: "front_windshield", text_query: "Vidrio panorámico", question_category_id: 3, question_type: "range",order_question: 38, points: 30 },
  { key: "fabric_stickers  ", text_query: "Calcomanías de fábrica", question_category_id: 3, question_type: "range", order_question: 39, points: 2 },
  { key: "frontal_bumper", text_query: "Bumper delantero", question_category_id: 3, question_type: "range",order_question: 40, points: 20 },
  { key: "turn_frontal_lights_button", text_query: "Direccionales delanteras", question_category_id: 3, question_type: "yes_or_no", order_question: 41, points: 10 },
  { key: "turn_lights_on_rearview_mirrors", text_query: "Direccionales en retrovisores", question_category_id: 3, question_type: "yes_no_na", order_question: 42, points: 10 },
  { key: "paint_cond", text_query: "Condición de la pintura", question_category_id: 3, question_type: "range",order_question: 43, points: 40 },
#PARTE BAJA
  { key: "wiring_state", text_query: "Estado de cables eléctricos", question_category_id: 4, question_type: "range", order_question: 1, points: 10 },
  { key: "exhaust_system_status", text_query: "Estado sistema de escape", question_category_id: 4, question_type: "range", order_question: 2, points: 15 },
  { key: "exhaust_tubing_state", text_query: "Estado tuberías", question_category_id: 4, question_type: "range", order_question: 3, points: 10 },
  { key: "clutch", text_query: "Funcionamiento de embrague", question_category_id: 4, question_type: "range", order_question: 4, points: 55 },
  { key: "gearbox", text_query: "Funcionamiento de caja de cambios", question_category_id: 4, question_type: "good_bad", order_question: 5, points: 55 },
  { key: "gearbox_handle_operation", text_query: "Operación palanca de cambios", question_category_id: 4, question_type: "good_bad", order_question: 6, points: 20 },
  { key: "gearbox_4_4_control", text_query: "Operación palanca ó control 4x4", question_category_id: 4, question_type: "yes_no_na", order_question: 7, points: 20 },
  { key: "fluid_leaks", text_query: "Sin fugas de fluidos", question_category_id: 4, question_type: "yes_or_no", order_question: 8, points: 30 },
  { key: "suspension", text_query: "Estado de suspensión", question_category_id: 4, question_type: "range", order_question: 9, points: 55 },
  { key: "steel_cable_state", text_query: "Estado de guayas", question_category_id: 4, question_type: "range", order_question: 10, points: 10 },
#LLANTAS Y SUSPENSION
  { key: "front_left_tire_treading", text_query: "Labrado de las llantas frontal izquierda", question_category_id: 5, question_type: "range", order_question: 3, points: 8 },
  { key: "front_left_tire_rim", text_query: "Estado de Rines o copas frontal izquierda", question_category_id: 5, question_type: "range", order_question: 4, points: 8 },
  { key: "front_left_original_bolts", text_query: "Pernos originales frontal izquierda", question_category_id: 5, question_type: "yes_or_no", order_question: 5, points: 8 },
  { key: "front_left_tire_alignment", text_query: "Posición de las llantas frontal izquierda", question_category_id: 5, question_type: "good_bad", order_question: 6, points: 5 },
  { key: "front_left_shock_absorber", text_query: "Amortiguadores delanteros frontal izquierda", question_category_id: 5, question_type: "good_bad", order_question: 7, points: 8 },
  { key: "rear_left_tire_treading", text_query: "Labrado de las llantas frontal trasera", question_category_id: 5, question_type: "range", order_question: 8, points: 8 },
  { key: "rear_left_tire_rim", text_query: "Estado de Rines o copas frontal trasera", question_category_id: 5, question_type: "range", order_question: 9, points: 8 },
  { key: "rear_left_original_bolts", text_query: "Pernos originales frontal trasera", question_category_id: 5, question_type: "yes_or_no", order_question: 10, points: 8 },
  { key: "rear_left_tire_alignment", text_query: "Posición de las llantas frontal trasera", question_category_id: 5, question_type: "good_bad", order_question: 11, points: 5 },
  { key: "original_tire_kit", text_query: "Kit de despinche original", question_category_id: 5, question_type: "yes_no_na", order_question: 12, points: 1 },
  { key: "spare_tire", text_query: "Llanta de respuesto", question_category_id: 5, question_type: "yes_or_no", order_question: 13, points: 8 },
  { key: "rear_right_tire_treading", text_query: "Labrado de las llantas trasera derecha", question_category_id: 5, question_type: "range",order_question: 14, points: 8 },
  { key: "rear_right_tire_rim", text_query: "Estado de Rines o copas trasera derecha", question_category_id: 5, question_type: "range",order_question: 15, points: 8 },
  { key: "rear_right_original_bolts", text_query: "Pernos originales trasera derecha", question_category_id: 5, question_type: "yes_or_no",order_question: 16, points: 8 },
  { key: "rear_right_tire_alignment", text_query: "Posición de las llantas trasera derecha", question_category_id: 5, question_type: "good_bad",order_question: 17, points: 5 },
  { key: "front_right_tire_treading", text_query: "Labrado de las llantas frontal derecha", question_category_id: 5, question_type: "range", order_question: 18, points: 8 },
  { key: "front_right_tire_rim", text_query: "Estado de Rines o copas frontal derecha", question_category_id: 5, question_type: "range", order_question: 19, points: 8 },
  { key: "front_right_original_bolts", text_query: "Pernos originales frontal derecha", question_category_id: 5, question_type: "yes_or_no", order_question: 20, points: 8 },
  { key: "front_right_tire_alignment", text_query: "Posición de las llantas frontal derecha", question_category_id: 5, question_type: "good_bad", order_question: 21, points: 5 },
  { key: "front_right_shock_absorber", text_query: "Amortiguadores delanteros frontal derecha", question_category_id: 5, question_type: "good_bad", order_question: 22, points: 8 },
  { key: "wheel_noises", text_query: "Ruidos en las llantas", question_category_id: 5, question_type: "yes_or_no", order_question: 23, points: 55 },
#ACCESORIOS
  { key: "air_conditioner_a", text_query: "Aire acondicionado", question_category_id: 6, question_type: "yes_no_na", order_question: 1, points: 0 },
  { key: "sliding_roof_a", text_query: "Techo corredizo", question_category_id: 6, question_type: "yes_no_na", order_question: 2, points: 0 },
  { key: "sunroof_a", text_query: "Claraboya", question_category_id: 6, question_type: "yes_no_na", order_question: 3, points: 0 },
  { key: "electric_glasses_a", text_query: "Vidrios eléctricos", question_category_id: 6, question_type: "yes_no_na", order_question: 4, points: 0 },
  { key: "hydraulic_steering_a", text_query: "Dirección hidráulica", question_category_id: 6, question_type: "yes_no_na", order_question: 5, points: 0 },
  { key: "central_blocking_a", text_query: "Bloqueo central", question_category_id: 6, question_type: "yes_no_na", order_question: 6, points: 0 },
  { key: "alarm_a", text_query: "Alarma", question_category_id: 6, question_type: "yes_no_na", order_question: 7, points: 0 },
  { key: "leather_upholstery_a", text_query: "Tapicería en cuero", question_category_id: 6, question_type: "yes_no_na", order_question: 8, points: 0 },
  { key: "explorer_lights_a", text_query: "Luces exploradoras", question_category_id: 6, question_type: "yes_no_na", order_question: 9, points: 0 },
  { key: "abs_brakes", text_query: "Frenos ABS", question_category_id: 6, question_type: "yes_no_na", order_question: 10, points: 0 },
])

DocumentType.create([
  { key: "contrato_compraventa_venta", name: "Contrato de compraventa", process_type: "sell"},
  { key: "mandato", name: "Mandato", process_type: "sell"},
  { key: "carta_banco", name: "Estato de cuenta", process_type: "sell"},
  { key: "formato_transito_venta", name: "Formato de tránsito", process_type: "sell"},
  { key: "formato_levantamiento_prenda", name: "Formato de levantamiento de prenda", process_type: "sell"},
  { key: "copia_cedula_venta", name: "Copia cédula", process_type: "sell"},
  { key: "copia_tarjeta_propiedad", name: "Copia tarjeta de propiedad", process_type: "sell"},
  { key: "soat", name: "SOAT", process_type: "sell"},
  { key: "peritaje_firmado", name: "Peritaje firmado", process_type: "sell"},
  { key: "contrato_corretaje", name: "Contrato corretaje", process_type: "sell"},
  { key:"certificado_dijin", name:"Certificado DIJIN", process_type: "sell"},
  { key: "terminos_condiciones_venta", name: "Términos y condiciones", process_type: "sell"},
  { key: "formato_inscripcion", name: "Formato de inscripción de cuentas de pago a proveedores", process_type: "sell"},
  { key: "manifiesto_aduana", name: "Manifiesto de aduana", process_type: "sell"},
  { key: "factura_compra", name: "Factura inicial de compra", process_type: "sell"},
  { key: "impuestos_pagados", name: "Impuestos pagados", process_type: "sell"},
  { key: "poder_especial", name: "Poder especial", process_type: "sell"},
  { key: "improntas", name: "Improntas", process_type: "sell"},
  { key: "tradicion_libertad", name: "Certificado de tradición y libertad" , process_type: "sell"},
  { key: "contrato_compraventa_compra", name: "Contrato de compraventa" , process_type: "buy"},
  { key: "endoso_poliza", name:"Endoso de póliza", process_type: "buy"},
  { key: "terminos_condiciones_compra", name: "Términos y condiciones", process_type: "buy"},
  { key: "formato_transito_compra", name: "Formato de tránsito", process_type: "buy"},
  { key: "copia_cedula_compra", name: "Copia cédula", process_type: "buy"},
  { key: "pedido_vehiculo", name: "Pedido de vehículo", process_type: "buy"},
  { key: "solicitud_credito", name: "Solicitud de crédito", process_type: "buy"},
  { key: "estudio_credito", name: "Estudio de crédito", process_type: "buy"},
  { key: "aval_negocio", name: "Aval de negocio", process_type: "buy"},
  { key: "aprobacion_credito", name: "Carta aprobación de crédito", process_type: "buy"},
  { key: "desembolso_credito", name: "Desembolso de crédito", process_type: "buy"},
  { key: "pago_total", name: "Pago total", process_type: "buy"},
  { key: "soporte_pago", name: "Soporte de pago reserva", process_type: "buy"},
  { key: "pagare", name: "Pagaré", process_type:  "buy"},
  { key: "copia_cedula_compra_emp", name: "Copia cédula representante legal", process_type: "buy"},
  { key: "copia_cedula_venta_emp", name: "Copia cédula representante legal", process_type: "sell"},
  { key: "ccb_empresa_compra", name: "Cámara de comercio", process_type: "buy"},
  { key: "ccb_empresa_venta", name: "Cámara de comercio", process_type: "sell"}
])
