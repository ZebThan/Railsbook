class RegistrationsController < Devise::RegistrationsController


private
 
  def sign_up_params
    params.require(:user).permit(:name, :about, :age, :sex, :email, :password, :password_confirmation, :avatar)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :about, :age, :sex, :email, :password, :password_confirmation, :current_password)
  end	

 end