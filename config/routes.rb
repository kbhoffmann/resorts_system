Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/resorts', to: 'resorts#index'
  get '/resorts/:id', to: 'resorts#show'
  # get '/resorts/:id/pass_holders_table', to: 'pass_holders#visitors'

  get '/pass_holders', to: 'pass_holders#index'
  get '/pass_holders/:id', to: 'pass_holders#show'

  get '/resorts/new', to: 'resorts#new'
  post '/resorts', to: 'resorts#create'


end
