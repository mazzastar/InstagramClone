Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources :posts do
    # resources :users
    resources :likes do 
      collection do 
        delete :destroy
      end
    end
  end
  
  resources :hashtags

end
