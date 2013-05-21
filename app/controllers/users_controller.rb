class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :right_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:sucess] = "Welcome"
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:sucess] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  def signed_in_user 
    redirect_to signin_path, notice: "Please sign in" unless signed_in?
  end
  def right_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy 
    User.find(params[:id]).destroy
    flash[:sucess] = "Deleted user."
    redirect_to users_path
  end

  private
   def correct_user
    @user = User.find(params[:id])
     redirect_to(root_path) unless current_user?(@user)
   end
   def admin_user
    redirect_to(root_path) unless current_user.admin?
   end
end

