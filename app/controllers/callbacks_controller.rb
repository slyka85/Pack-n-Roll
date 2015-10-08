class CallbacksController < Devise::OmniauthCallbacksController

  def providers
    # binding.pry
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  alias_method :twitter, :providers
  alias_method :facebook, :providers
  alias_method :linkedin, :providers
  alias_method :github, :providers
  
end