class CallbacksController < Devise::OmniauthCallbacksController

  def providers
    # binding.pry
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # if @user.persisted?
    sign_in_and_redirect @user, notice: "Signed in!"
  # else
  #   redirect_to new_user_registration_url
  # end
  end


  [:facebook, :twitter, :google_oauth2, :linkedin, :github].each do |provider|
    alias_method  provider, :providers
  end



  
end