class RegistrationsController < Devise::RegistrationsController
  
  def create
  	p "********************************************************************************"
  	p sign_up_params
  	user = User.new(sign_up_params)
  	p user
  	if user.save
  		redirect_to root_path
  	else
  		p "NOT SAVED"
  		redirect_to root_path
  	end
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

end
