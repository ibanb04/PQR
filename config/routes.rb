Rails.application.routes.draw do
  devise_for :users
  #Mostrar los datos de la tabla
  get '/departaments', to: 'departaments#index'
  #Crear un nuevo departamento
  get '/departaments/new', to: 'departaments#new',as: 'new_departament'
  post '/departaments', to: 'departaments#create'
  #Tomar los valores con el Id
  get '/departaments/:id', to: 'departaments#show', as: 'departament'

  get '/departaments/:id/edit', to: 'departaments#edit', as: 'edit_departament'
  #Actualizar valores
  patch 'departaments/:id', to: 'departaments#update'
  #Eliminar datos
  delete '/departaments/:id', to: 'departaments#delete'
  
  resources :users
  resources :audits
  resources :states
  resources :pqrs
  resources :reviews
  resources :notifications
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
