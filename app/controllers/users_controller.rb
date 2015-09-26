class UsersController < ApplicationController

  def show
    session_user = User.find(current_user.id).to_json(:include => :trips)
    render json: session_user
  end

end