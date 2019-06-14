Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  scope module: 'v1' do
    scope :benchmarks, controller: :benchmarks do
      get :new, as: 'new_benchmark'
      get :index, as: 'benchmarks_index'
      # get :show, as: 'show_benchmark'
      get 'show/:benchmark_id',to: 'benchmarks#show', as:'show_benchmark'
      post :search, as: 'benchmarks_search'
      post :create, as: 'create_benchmark'
    end
    scope :brands, controller: :brands do
      get :index, as: 'brands_index'
      post :create, as: 'create_brand'
      get :new, as: 'new_brand'
    end
    scope :processes, controller: :processes do
      get :index, as: 'processes_index'
    end
    scope :questions, controller: :questions do
      get :new, as: 'new_question'
      get :get_categories, as: 'get_categories'
      get :index, as: 'index_questions'
      post :create, as: 'create_question'
    end
  end

  root to: 'v1/benchmarks#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
