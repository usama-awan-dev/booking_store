class HomesController < ApplicationController
before_action :authenticate_user!
 


def home_page
   @shop = current_user.shop
  end

  def assign_role
    @user = User.new
  end

  def create_user
   
        @user=User.new(user_params)
       if @user.save
        flash[:notice] = "user created succesfully"
         redirect_to assign_role_path
       else
          render :assign_role
        end


  end



    private

    def user_params

        params.require(:user).permit(:email, :password, :role, :name)
    
    end

end
