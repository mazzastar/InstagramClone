Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  root 'home#index'

  resources :posts do
    resources :charges
    resources :likes do 
      collection do 
        delete :destroy
      end
    end
  end
  
  resources :hashtags
  resources :orders

end
