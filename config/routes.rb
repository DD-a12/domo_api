Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do 
    namespace :v1 do 
      resource :session, only: [:create, :destroy]
      resources :users, only: [:create] do 
        get :current, on: :collection 
      end
      resources :albums do
        delete '/pictures/:id', to: 'albums#destroyPics'
      end
    end
  end
end
