Rails.application.routes.draw do
  mount LetsencryptHttpChallenge::Engine => "/" unless ENV['LE_HTTP_CHALLENGE_RESPONSE'].blank?

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :users do
    get :control
  end
  resources :articles do
    resources :comments
  end
  resources :projects
  root 'welcome#index'
end
