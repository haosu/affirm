Affirm::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions' }

  resources :users
  resources :goals do
    resources :affirmations, only: %i(index create edit destroy)
  end
end
