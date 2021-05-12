class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notf, except: %i[sign_in]
  before_action :authenticate_user!


  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
  end

  def set_notf
    @n1 = Request.got_any_requests?(current_user).length
  end

end
