class UsersController < ApplicationController

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
      @users = policy_scope(User).order(created_at: :asc)
    end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
