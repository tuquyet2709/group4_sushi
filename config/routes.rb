Rails.application.routes.draw do

  get '/login', to: 'session#new'

  post '/login', to: 'session#create'

  delete '/logout', to: 'session#destroy'

  scope "(:locale)", locale:/ja|en/ do
    root "static_pages#home"
    get "static_pages/home"
  end

  resources :students
  resources :companies
  resources :works
end
