Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  scope module: 'v1' do
    scope :benchmarks, controller: :benchmarks do
      get :new, as: 'new_benchmark'
      get :edit, as: 'edit_benchmark'
      get :validation, as: 'validation_benchmark'
      get :index, as: 'benchmarks_index'
      get 'show/:benchmark_id',to: 'benchmarks#show', as:'show_benchmark'
      post :search, as: 'benchmarks_search'
      get :search, to: 'benchmarks#init'
      post :create, as: 'create_benchmark'
      put :update, as: 'update_benchmark'
    end
    scope :brands, controller: :brands do
      get :index, as: 'brands_index'
      post :create, as: 'create_brand'
      post :create_user, as: 'create_user'
      get :new, as: 'new_brand'
      get :admin_home, as: 'brand_admin_home'
      get :new_user, as: "new_brand_user"
    end
    scope :processes, controller: :processes do
      get :index, as: 'processes_index'
      get :new, as: 'new_process'
      patch :update, as: 'update_process'
      get :validation, as: 'validation_process'
      get 'show/:process_id',to: 'processes#show', as:'show_process'
      post :search, as: 'processes_search'
      get :search, to: 'process#init'
      post :create, as: 'create_process'
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
