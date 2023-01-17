class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :unauthorized
  def create
    user = User.create(user_params)
    return invalid_user(user) unless user.valid?

    session[:user_id] = user.id
    render json: user, only: [:id, :username, :image_url, :bio], status: :created
  end

  def show
    user = User.find(session[:user_id])
    render json: user, only: [:id, :username, :image_url, :bio], status: :created
  end

  private

  def user_params
    params.permit([:username, :password, :password_confirmation, :image_url, :bio])
  end

  def unauthorized
    render json: { errors: 'You do not have permissions for this request' }, status: :unauthorized
  end

  def invalid_user(user)
    render json: { errors: user.errors.messages.to_a }, status: :unprocessable_entity
  end
end
