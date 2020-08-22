Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  
  root 'posts#index'
 
  get 'posts',to:'posts#index'

  get '/new' ,to: 'posts#new' ,as: 'new'

  # get '/edit' ,to: 'posts#edit' ,as: 'edit'

  post '/create', to: 'posts#create', as: 'create'

  # get 'posts/:id/edit', to: 'posts#edit', as: 'edit'
 
  patch 'posts/:id/update', to: 'posts#update', as:'update'

  get 'posts/:id/show' ,to: 'posts#show' ,as:'show'
  get 'posts/:id/edit', to: 'posts#edit', as: 'edit'

  get 'posts/:id/destroy' ,to: 'posts#destroy' ,as:'destroy'

  get 'posts/delete', to: 'posts#delete',as: 'delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
