Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get 'logout' => 'home#logout'
  post 'login' => 'home#login'

  resources :rooms do
    # /rooms/:room_id/messages
    resources :messages
  end


  # GET /messages
  # POST /messages
  # GET /messages/:id
  # PUT/PATCH /messages/:id
  # ...
  # resources :messages
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
