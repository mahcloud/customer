Patron::Application.routes.draw do
  post '/addresses', to: 'addresses#create'
  post '/addresses/:id', to: 'addresses#update'
end
