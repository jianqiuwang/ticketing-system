class UsersController < ApplicationController
    before_action :authorized, only: [:show]
    def create
        user = User.create(user_params)
        puts "User errors: #{user.errors.full_messages}" if user.invalid?
        if user.valid?
        session[:user_id] = user.id
        puts "Session after user creation: #{session.inspect}"
        render json: user, status: :created
        else
        render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end 

    def show
        current_user = User.find_by(id: session[:user_id])
        if current_user
          render json: current_user
        else
          render json: { error: "User not found" }, status: :not_found
        end
    end
      

    private
    def user_params
        params.permit(:email, :password)
    end

    def authorized
        puts "Session contents: #{session.inspect}"
        return render json: {errors: "Not Authorized"}, status: :unauthorized unless session[:user_id].present?
    end
    
end
