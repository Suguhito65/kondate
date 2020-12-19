class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.order("created_at DESC")
  end

  def destroy
    
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end
end
