Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  get '/benchmarks', to: 'benchmarks#temp_benchmark', as: 'benchmark_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
