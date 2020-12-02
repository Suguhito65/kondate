class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :destroy]
  def index
    @recipes = Recipe.includes(:user).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
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
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def search
    @recipes = Recipe.search(params[:keyword]).order("RAND()").limit(1)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:cuisine, :description, :foodstuff, :image).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    if current_user.id != @recipe.user_id
      redirect_to action: :index
    end
  end
end
