Rails.application.routes.draw do

  devise_for :professores, path: '', 
    path_names: { sign_in: :entrar, sign_out: :sair, sign_up: :cadastrar },
    controllers: {
      sessions: 'professores/sessions',
      registrations: 'professores/registrations',
      omniauth_callbacks: 'professores/omniauth_callbacks'
    }

  devise_scope :professor do
    authenticated  do
      root to: 'professores/dashboard#index', as: 'authenticated_patient_root'
    end

    unauthenticated do
      root to: 'landing/main#index', as: 'unauthenticated_professor_root'
    end
  end

  authenticate(:professor) do
    get 'profile', to: 'professores/profile#index'
    get 'profile/edit', to: 'professores/profile#edit', as: 'edit_professor'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'estudante', to: 'landing/estudante#index', as: 'estudante'
  get 'pai', to: 'landing/pai#index', as: 'pai'
  get 'professor', to: 'landing/professor#index', as: 'professor'
  get 'escola', to: 'landing/escola#index', as: 'escola'
  get 'governo', to: 'landing/governo#index', as: 'governo'
  get 'sobre', to: 'landing/sobre#index', as: 'sobre'
  get 'join', to: 'landing/join#index', as: 'join'
  get 'pricing', to: 'landing/pricing#index', as: 'pricing'
  get 'servicos', to: 'landing/servicos#index', as: 'servicos'
  get 'contato', to: 'landing/contato#new', as: 'contato'

  get 'escola/clientes', to: 'landing/escola/clientes#index', as: 'escola_clientes'
  get 'escola/contato', to: 'landing/escola/contato#new', as: 'escola_contato'

  get 'governo/clientes', to: 'landing/governo/clientes#index', as: 'governo_clientes'
  get 'governo/contato', to: 'landing/governo/contato#new', as: 'governo_contato'

  get 'professor/clientes', to: 'landing/professor/clientes#index', as: 'professor_clientes'
  get 'professor/contato', to: 'landing/professor/contato#new', as: 'professor_contato'

  get 'estudante/clientes', to: 'landing/estudante/clientes#index', as: 'estudante_clientes'
  get 'estudante/contato', to: 'landing/estudante/contato#new', as: 'estudante_contato'

  get 'pai/clientes', to: 'landing/pai/clientes#index', as: 'pai_clientes'
  get 'pai/contato', to: 'landing/pai/contato#new', as: 'pai_contato'



end
