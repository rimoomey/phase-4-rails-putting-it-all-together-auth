class RecipesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :no_logged_in_user
  def index
    user = User.find(session[:user_id])
    render json: user.recipes, include: [:user], status: :ok
  end

  def create
    user = User.find(session[:user_id])
    recipe = user.recipes.create(recipe_params)
    return render json: recipe, include: [:user], status: :created if recipe.valid?

    invalid_recipe
  end

  private

  def invalid_recipe
    render json: { errors: ['Invalid recipe data'] }, status: :unprocessable_entity
  end

  def recipe_params
    params.permit([:title, :instructions, :user_id, :minutes_to_complete])
  end

  def no_logged_in_user
    render json: { errors: ['No one is currently logged in'] }, status: :unauthorized
  end
end
