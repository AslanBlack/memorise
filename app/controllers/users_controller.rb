class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :show]
 
  def new
    @user = User.new
    
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Welcome Home #{@user.username}"
      redirect_to user_path(@user)
      
    else
      render 'new'
    end
    
    
    
  end
  
  def show
     @user = User.find(params[:id])
     @memo = Memo.new
     #@memos = Memo.all
     @memos = @user.memos
  end
  
  def destroy
     @memo.destroy
     redirect_to user_path(@user)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
    
  end
  
   def set_user
     @user = User.find(params[:id])
   end
  
  def require_same_user
    if current_user != @user #and !current_user.admin?
      
      redirect_to root_path
    end
    
  end
  
end