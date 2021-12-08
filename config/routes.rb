Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  get '/resorts', to: 'resorts#index'
  get '/resorts/new', to: 'resorts#new'
  post '/resorts', to: 'resorts#create'
  get '/resorts/:id', to: 'resorts#show'
  get '/resorts/:id/edit', to: 'resorts#edit'
  patch '/resorts/:id', to: 'resorts#update'
  delete '/resorts/:id', to: 'resorts#destroy'

  get '/resorts/:resort_id/pass_holders', to: 'resort_pass_holders#index'
  get '/resorts/:resort_id/pass_holders/new', to: 'resort_pass_holders#new'
  post '/resorts/:resort_id/pass_holders', to: 'resort_pass_holders#create'

  get '/instructors', to: 'instructors#index'
  get '/instructors/new', to: 'instructors#new'
  post '/instructors', to: 'instructors#create'
  get '/instructors/:id', to: 'instructors#show'
  get '/instructors/:id/edit', to: 'instructors#edit'
  patch '/instructors/:id', to: 'instructors#update'
  delete '/instructors/:id', to: 'instructors#destroy'

  get '/instructors/:instructor_id/students', to: 'instructor_students#index'
  get '/instructors/:instructor_id/students/new', to: 'instructor_students#new'
  post '/instructors/:instructor_id/students', to: 'instructor_students#create'

  get '/pass_holders', to: 'pass_holders#index'
  get '/pass_holders/:id', to: 'pass_holders#show'
  get '/pass_holders/:id/edit', to: 'pass_holders#edit'
  patch '/pass_holders/:id', to: 'pass_holders#update'
  delete '/pass_holders/:id', to: 'pass_holders#destroy'

  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  get '/students/:id/edit', to: 'students#edit'
  patch '/students/:id', to: 'students#update'
  delete '/students/:id', to: 'students#destroy'

end
