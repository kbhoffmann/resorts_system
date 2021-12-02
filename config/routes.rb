Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/resorts', to: 'resorts#index'
  get '/resorts/:id', to: 'resorts#show'
  get '/resorts/:resort_id/pass_holders', to: 'resort_pass_holders#index'

  get '/instructors', to: 'instructors#index'

  get '/pass_holders', to: 'pass_holders#index'
  get '/pass_holders/:id', to: 'pass_holders#show'


  get '/resorts/new', to: 'resorts#new'
  post '/resorts', to: 'resorts#create'
end
