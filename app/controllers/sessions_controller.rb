class SessionsController < ApplicationController

    get "/login" do
        erb :"/users/login"
    end
    
    post "/login" do 
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect to "/appointments"
        
      else 
        redirect to "/login"
      end 
    end

    get "/logout" do
        session.destroy
        redirect to "/"
    end

    end