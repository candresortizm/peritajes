Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  scope module: 'v1' do
    scope :benchmarks, controller: :benchmarks do
      get :index, as: 'benchmarks_index'
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

  root to: 'v1/benchmarks#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
