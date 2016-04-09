class MemosController < ApplicationController
  
  def new 
    @memo = Memo.new
  end 
  
  def edit 
     
  end 
  
  def create
   
    @memo = Memo.new(memo_params)
    @user = current_user
    @memo.user = current_user
    if @memo.save
      flash[:success] = "Your memo was successfully created"
      redirect_to user_path(@user)
    else 
      flash[:danger] = "Memo was not created"
      redirect_to user_path(@user)
    end
  end 
  
  def show 
    
  end
  
  def destroy
     @user = current_user
     @memo = Memo.find(params[:id])
     @memo.destroy
     redirect_to user_path(@user)
  end
  
  private 
  
   def memo_params
      params.require(:memo).permit(:title, :url)
   end 
  
end
