class Professores::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @professor = Professor.from_oauth(request.env["omniauth.auth"])

    if @professor.persisted?
      sign_in_and_redirect @professor, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_professor_registration_url
    end
  end

  def google_oauth2
    @professor = Professor.from_oauth(request.env["omniauth.auth"])

    if @professor.persisted?
      sign_in_and_redirect @professor, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_professor_registration_url
    end
  end

  # GET|POST /resource/auth/google
  #def passthru
    #super
  #end

  # GET|POST /users/auth/twitter/callback
  def failure
    super
  end

  protected

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end
end
