class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_state, only: [:create]

  def new
    super
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def user_state
    user = User.find_by(email: params[:user][:email])
      return if user.nil?
      return unless user.valid_password?(params[:user][:password]) && user.active_for_authentication?
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration_path
  end
end
