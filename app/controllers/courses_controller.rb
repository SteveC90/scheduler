class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    respond_to do |format|
      if !session[:user_id]
        format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
      else
        format.html # index.html.erb
        # format.json { render json: @courses }
      end
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  # def show
  #   @course = Course.find(params[:id])

  #   respond_to do |format|
  #     if !session[:user_id]
  #       format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
  #     else
  #       format.html # show.html.erb
  #       format.json { render json: @course }
  #     end
  #   end
  # end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new
    #@user.id == session[:user_id]
    # @subjects = Subject.all

    respond_to do |format|
      if !session[:user_id] || User.find_by_id(session[:user_id]).role == User::ROLES[0]
        format.html {redirect_to home_url, notice: 'You do not have permission to create courses'}
      elsif Subject.count == 0
        format.html { redirect_to courses_url, notice: 'Cannot create courses without any subjects.' }
        # format.json { head :no_content }
      else
        format.html # new.html.erb
        # format.json { render json: @course }
       end
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])

    # @subjects = Subject.all
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: 'Course was successfully created.' }
        # format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        # format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to courses_url, notice: 'Course was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.destroy
        format.html { redirect_to courses_url }
        # format.json { head :no_content }
      else
        format.html { redirect_to courses_url, notice: "Can\'t delete this course because it has sections."}
      end
    end
  end
end
