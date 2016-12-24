Rails.application.routes.draw do

  devise_for :professores, path: '', 
    path_names: { sign_in: :entrar, sign_out: :sair, sign_up: :cadastrar },
    controllers: {
      sessions: 'professores/sessions',
      registrations: 'professores/registrations',
      omniauth_callbacks: 'professores/omniauth_callbacks'
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "landing/main#index"

  get 'estudante', to: 'landing/estudante#index', as: 'estudante'
  get 'pai', to: 'landing/pai#index', as: 'pai'
  get 'professor', to: 'landing/professor#index', as: 'professor'
  get 'escola', to: 'landing/escola#index', as: 'escola'
  get 'governo', to: 'landing/governo#index', as: 'governo'
  get 'sobre', to: 'landing/sobre#index', as: 'sobre'
  get 'join', to: 'landing/join#index', as: 'join'

end
