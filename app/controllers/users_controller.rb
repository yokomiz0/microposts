class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'profileを編集しました'
    else
      render 'edit'
    end
  end

  private


  def set_user
    # if !(session.nil?)
    #   @user ||= User.find(session[:user_id]) 
    # else 
      @user ||= User.find(params[:id])
    # end
  end
  
  def correct_user
    if @user != current_user
      redirect_to @user
    end
  end
  
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :profile, :area,
                                 :password_confirmation)
  end
end
