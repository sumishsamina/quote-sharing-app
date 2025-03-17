class SessionsController < ApplicationController
        #Displays the log in form
        def new
        end
    
        def create
          user = User.find_by(email: params[:email])#Locates the user by the email 
          if user && user.authenticate(params[:password]) && user.status == "Active"#Checks if the user exixts,if the paasword is corrrect and if the status of the use is active 
            session[:user_id] = user.id
            session[:fname] = user.fname
            session[:is_admin] = user.is_admin
            if session[:is_admin]#redirect the the path based on if the user is an admin
              redirect_to admin_path, notice: "Logged in successfully!"
            else
              redirect_to userhome_path, notice: "Logged in successfully!"
            end
          else
            flash.now[:error] = "Invalid email or password. Please try again."#If the authentication fails then display an error messasge and re-render the log in form
            render 'new'
          end
        end
        #Handles user log out
        def destroy
          session[:user_id] = nil#Clears out the session by having the user_id to nil
          redirect_to root_path, notice: "Logged out successfully!"#REdirects the user to homepage with a succesfull login message.
        end  
end
