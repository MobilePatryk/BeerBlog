class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end
  def create
    @ip = request.remote_ip
    debugger
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:succes] = "Welcome to BeerBlog #{@user.username}"
      redirect_to user_path(@user)  
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:succes] = "Your accoutn was update succesfuly"
      redirect_to beers_path
    else
      render 'edit'
    end
  end


  def show
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
  def set_user
    @user = User.find(params[:id])
  end

   def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit or delete your own account"
        redirect_to users_path
      end
    end
end
