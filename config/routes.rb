Rails.application.routes.draw do

  devise_for :user, :super_users, :concessionaire_admins, :car_experts, :dispatchers, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  scope module: 'v1' do
    scope :car_inspections, controller: :car_inspections do
      get :new, as: 'new_car_inspection'
      get 'edit/:car_inspection_id',to: 'car_inspections#edit', as:'edit_car_inspection'
      get :validation, as: 'validation_car_inspection'
      get :index, as: 'car_inspections_index'
      get 'show/:car_inspection_id',to: 'car_inspections#show', as:'show_car_inspection'
      post :search, as: 'car_inspections_search'
      get :search, to: 'car_inspections#init'
      post :create, as: 'create_car_inspection'
      put :update, as: 'update_car_inspection'
    end
    scope :concessionaires, controller: :concessionaires do
      get :index, as: 'concessionaires_index'
      post :create, as: 'create_concessionaire'
      post :create_user, as: 'create_user'
      get :new, as: 'new_concessionaire'
      get :admin_home, as: 'concessionaire_admin_home'
      get :new_user, as: "new_concessionaire_user"
    end
    scope :car_processes, controller: :car_processes do
      get :index, as: 'car_processes_index'
      get :new, as: 'new_car_process'
      patch :update, as: 'update_car_process'
      get :validation, as: 'validation_car_process'
      get 'show/:car_process_id',to: 'car_processes#show', as:'show_car_process'
      post :search, as: 'car_processes_search'
      get :search, to: 'car_process#init'
      post :create, as: 'create_car_process'
    end
    scope :questions, controller: :questions do
      get :new, as: 'new_question'
      get :get_categories, as: 'get_categories'
      get :index, as: 'index_questions'
      post :create, as: 'create_question'
    end
  end

  root to: 'v1/other_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
