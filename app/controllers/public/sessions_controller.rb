class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_state, only: [:create]

  def new
    super
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "新規登録に成功しました"
    flash[:notice] = "ログインに成功しました"
    user_path(resource.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました"
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:last_name, :first_name, :kana_first, :kana_last, :email])
  end

  def user_state
    user = User.find_by(email: params[:user][:email])
    return if user.nil?
    return if user.valid_password?(params[:user][:password]) && user.active_for_authentication?
    flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    redirect_to new_user_registration_path
  end
end
