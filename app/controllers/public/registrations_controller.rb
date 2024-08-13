class Public::RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end
  
  def after_sign_in_path_for(resource)
    posts_path
  end
end
