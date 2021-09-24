Rails.application.routes.draw do
 
  devise_for :users
  root 'expenses#index'
  
  get 'expenses/new'
  get 'expenses/edit'
 
  resources :expenses
 
 end
