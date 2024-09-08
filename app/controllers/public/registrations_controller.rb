class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    super
  end
  
  def create
    super
  end
  
  def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録に成功しました"
    user_path(resource.id)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
