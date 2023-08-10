class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { success: 'Signup successful! Welcome to our site.', user: user }, status: :created
        else
            puts user.errors.full_messages
            render json: { errors: ["Invalid username or password"]  }, status: :unauthorized
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
            head :no_content
        else
            return render json: { errors: ["Not authorized"] }, status: :unauthorized
        end
    end
end
