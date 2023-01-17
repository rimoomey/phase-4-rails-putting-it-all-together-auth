class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      return render json: user, only: [:id, :username, :image_url, :bio]
    end

    unauthorized
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
      return head :no_content
    end

    no_logged_in_user
  end

  private

  def no_logged_in_user
    render json: { error: 'No one is currently logged in' }, status: :unauthorized
  end

  def unauthorized
    render json: { errors: 'Unrecognized username and password combination' }, status: :unauthorized
  end
end
