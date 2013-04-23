class SectionsController < ApplicationController

  def dynamic_courses
    @courses = Course.find_all_by_subject_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all

    respond_to do |format|
      if !session[:user_id]
        format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
      else 
        format.html # index.html.erb
        # format.json { render json: @sections }
      end
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section = Section.find(params[:id])

    respond_to do |format|
      if !session[:user_id]
        format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
      else 
        format.html # show.html.erb
        # format.json { render json: @section }
      end
    end
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    @section = Section.new

    respond_to do |format|
      if !session[:user_id] || User.find_by_id(session[:user_id]).role == User::ROLES[0]
        format.html {redirect_to courses_url, notice: 'You do not have permission to access that page!'}
      else
        format.html # new.html.erb
        # format.json { render json: @section }
      end
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
    if !session[:user_id] || User.find_by_id(session[:user_id]).role == User::ROLES[0]
      redirect_to home_url, notice: 'You do not have permission to access that page!'
    end
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        # format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render action: "new" }
        # format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_url }
      # format.json { head :no_content }
    end
  end
end
