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
  end

end
