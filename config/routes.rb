Rails.application.routes.draw do
  get 'art_basel/index'
  root 'art_basel#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
