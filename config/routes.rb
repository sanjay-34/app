Rails.application.routes.draw do
  
  devise_for :users
  #root 'friends#index'
  #get 'posts/index'

  




  root 'posts#index'

  get 'posts/new'
  get 'friends/index' 


  resources :friends


  resources :posts do 
    resources :comments
  end


end
