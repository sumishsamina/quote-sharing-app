class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]#Set the user actions for the required steps
  before_action :require_login, except: [:new, :create]#Makes sure the user is loggged in for all actions except the new and create 


  # GET /users or /users.json
  #Displays list of users
  def index
    @users = User.all
  end
  #Displays the form for creating a new user
  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  #Displays the form for creating a new user
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  #Handles the creation of a new user
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        #format.html { redirect_to @user, notice: "User was successfully created." }
        format.html { redirect_to login_path, notice: "Sign up successful. Please log in." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  #Kepeps track of updated on user information
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  #Handles when a cetain user is deleted
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :is_admin, :status)
    end
end
