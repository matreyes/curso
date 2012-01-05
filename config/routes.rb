Cursouno::Application.routes.draw do

  devise_for :users

  root :to => "levels#index"

  resources :levels do
    resources :quizzes
  end

  resources :quizzes do
    resources :answers
  end

  resources :topics do
    resources :comments
  end

  namespace :admin do
    resources :users
    get '/tutors' => "users#index_tutors", as: :tutors_list
    post 'deliver_email' => 'users#deliver_email', as: :deliver_email
    get 'update_csv' => 'users#update_csv', as: :update_csv
  end

  post '/mail' => "main#send_mail"

end
