Patron::Application.routes.draw do
  root to: 'addresses#index'
  get '/address_book/', to: 'addresses#index', as: 'addresses'
  get '/address_book/newAddress', to: 'addresses#new', as: 'new_address'
  get '/address_book/edit/:id', to: 'addresses#edit', as: 'edit_address'
  post '/address_book/', to: 'addresses#create'
  put '/address_book/:id', to: 'addresses#update', as: 'address'
  delete '/address_book/delete/:id', to: 'addresses#destroy', as: 'destroy_address'
end
