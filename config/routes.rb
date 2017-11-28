Rails.application.routes.draw do
  resources :reviews
  get '/events' => 'art_basel#index'
  get '/artwork' => 'art_basel#artwork'

  root 'art_basel#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
