Rails.application.routes.draw do
  
  root 'expense#index'

  get 'expense/new'
  get 'expense/edit'
  
 
  resources :expense
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
