Rails.application.routes.draw do
  get '/events' => 'art_basel#index'

  root "art_basel#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
