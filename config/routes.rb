Rails.application.routes.draw do
 
  root 'expenses#index'
  
  get 'expenses/new'
  get 'expense/edit'
 
 resources :expenses
 
 end
