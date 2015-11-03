class Users::RegistrationsController < Devise::RegistrationsController

  def after_sign_out_path_for(user)
    new_user_info_path
  end

end
