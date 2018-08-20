class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    resource = build_resource(sign_up_params)
    yield resource if block_given?
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      flash[:error] = "Sorry, we could not save you in our database. Please contact an adminstrator. #{resource.inspect}"
      clean_up_passwords resource
      respond_with resource
    end
  end

  def update
    super
  end

  private
  def after_sign_up_path_for(*)
    posts_path
  end

  def sign_up_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
  end
end
