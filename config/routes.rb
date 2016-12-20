Rails.application.routes.draw do

  devise_for :professores, path: '', 
    path_names: { sign_in: :entrar, sign_out: :sair, sign_up: :cadastrar },
    controllers: {
      sessions: 'professores/sessions',
      registrations: 'professores/registrations',
      omniauth_callbacks: 'professores/omniauth_callbacks'
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "main#index"

  get 'estudante', to: 'estudante#index', as: 'estudante'
  get 'pai', to: 'pai#index', as: 'pai'
  get 'professor', to: 'professor#index', as: 'professor'
  get 'escola', to: 'escola#index', as: 'escola'
  get 'governo', to: 'governo#index', as: 'governo'
  get 'sobre', to: 'sobre#index', as: 'sobre'
  get 'join', to: 'join#index', as: 'join'

end
