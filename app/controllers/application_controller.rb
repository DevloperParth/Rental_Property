class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role first_name last_name mobile
                                                         email password password_confirmation])
		devise_parameter_sanitizer.permit(:account_update, keys: %i[ first_name last_name mobile
																													email password password_confirmation avatar])
  end




	
	

    
end
