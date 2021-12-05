Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/resorts', to: 'resorts#index'
  get '/resorts/new', to: 'resorts#new'
  get '/resorts/:id', to: 'resorts#show'
  get '/resorts/:resort_id/pass_holders', to: 'resort_pass_holders#index'
  post '/resorts', to: 'resorts#create'

  get '/instructors', to: 'instructors#index'
  get '/instructors/new', to: 'instructors#new'
  post '/instructors', to: 'instructors#create'
  get '/instructors/:id', to: 'instructors#show'
  get '/instructors/:id/edit', to: 'instructors#edit'
  patch '/instructors/:id', to: 'instructors#update'

  get '/instructors/:instructor_id/students', to: 'instructor_students#index'
  get '/instructors/:instructor_id/students/new', to: 'instructor_students#new'
  post '/instructors/:instructor_id/students', to: 'instructor_students#create'

  get '/pass_holders', to: 'pass_holders#index'
  get '/pass_holders/:id', to: 'pass_holders#show'

  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  get '/students/:id/edit', to: 'students#edit'
  patch '/students/:id', to: 'students#update'

end
