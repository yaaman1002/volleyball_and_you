class Public::SessionsController < Devise::SessionsController
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def new
    super
  end
  
#  def create
#  end
  
#  def destroy
#  end
end
