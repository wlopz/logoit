class Users::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(user)
    new_company_info_path
  end

end
