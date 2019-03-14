Rails.application.routes.draw do

  resources :boards do
    resources :lists do
      resources :items
    end
  end



  root 'boards#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
