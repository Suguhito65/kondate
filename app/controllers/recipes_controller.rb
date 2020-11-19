class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe =Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def recipe_params
    params.require(:recipe).permit(:cuisine, :description, :foodstuff, :image).merge(user_id: current_user.id)
  end
end
