Rails.application.routes.draw do
  get 'welcome/index'#, to: 'welcome#index' não precisa colocar pois é repetido
  #get '/inicio', to: 'welcome#index'
  
  resources :coins
  #get '/coins', to: 'coins#index'


  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end