Affirm::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users
  resources :goals do
    resources :affirmations, only: %i(create edit destroy)
    resources :posts, only: %i(show create destroy)
  end
end
