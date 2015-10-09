class CallbacksController < Devise::OmniauthCallbacksController

  def providers
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash.notice = "Welcome to Travel Packing Assistant! Fill out the trip information below and choose activities."
    sign_in_and_redirect @user
  else
    binding.pry
    redirect_to new_user_registration_url
  end
  end


  [:facebook, :google_oauth2, :linkedin, :github].each do |provider|
    alias_method  provider, :providers
  end



  
end