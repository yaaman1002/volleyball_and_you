# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  #layout 'admin'
  def new
    super
  end
  
  protected

  def after_sign_in_path_for(resource)
    flash[:notice] = "管理者のログインに成功しました。"
    admin_dashboards_path
  end
  # before_action :configure_sign_in_params, on
  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "管理者のログアウトに成功しました。"
    new_admin_session_path
  end
end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
# end
