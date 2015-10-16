class SessionsController < Devise::SessionsController
 layout "sign_in_layout"

  def new
  	super
  	# render :layout => 'sign_in_layout'

  end
end