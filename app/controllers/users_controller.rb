class UsersController < ApplicationController

  def remove_course
    @user = User.find(session[:user_id])
    @course = Course.find(params[:course_id])

    @user.courses.delete(@course);
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

    respond_to do |format|
      if !session[:user_id]
        format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
      else
        format.html # index.html.erb
        # format.json { render json: @users }
      end
    end
  end

  def add_courses
    if !session[:user_id]
      redirect_to home_url, notice: 'You must be logged in to access that page'
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      if !session[:user_id]
        format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
      else
        format.html # show.html.erb
        # format.json { render json: @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      # format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if !session[:user_id] || (session[:user_id] != @user.id && User.find_by_id(session[:user_id]).role != User::ROLES[2])
      redirect_to home_url, notice: "You cannot edit another users account."
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to home_url, notice: "User #{@user.name} was successfully created." }
        # format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.role == User::ROLES[2] && User.where(:role => User::ROLES[2]).length==1
      redirect_to users_url, :notice => 'Cannot delete last admin in the system.'
    else
      if @user.id == session[:user_id]
        session[:user_id] = nil
      end
      @user.destroy

      respond_to do |format|
        if session[:user_id]
          format.html { redirect_to users_url }
        #format.json { head :no_content }
        else
          format.html { redirect_to home_url }
        end
      end
    end
  end
end
