class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:update, :destory]  
  
    def current
      render json: current_user
    end
    
    def create
      user = User.new user_params
      if user.save
        session[:user_id] = user.id
        render json: {id: user.id}
      else
        render json: { errors: user.errors.full_messages}, status: 422 
      end
    end
  
    def update
      if params[:id] == "current"
        user = current_user
      else 
        user = User.find params[:id]
      end
  
      user.update!(user_params)
      render(
        json: { status: 200}
      )
    end
  
    
    
    private
    
    def find_user
      @user = User.find params[:id]
    end
  
    def user_params
      params
      .permit(
        :first_name, 
        :last_name, 
        :email,
        :avatar,
        :password,
        :password_confirmation
      )
    end
end
