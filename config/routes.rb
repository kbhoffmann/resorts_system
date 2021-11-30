Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/resorts', to: 'resorts#index'
  get '/resorts/new', to: 'resorts#new'
  post '/resorts', to: 'resorts#create'
end
