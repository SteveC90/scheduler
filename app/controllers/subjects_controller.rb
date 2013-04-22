class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all

    respond_to do |format|
      if !session[:user_id]
        format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
      else 
        format.html # index.html.erb
        #format.json { render json: @subjects }
      end
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  # def show
  #   @subject = Subject.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @subject }
  #   end
  # end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new

    respond_to do |format|
      if !session[:user_id] || User.find_by_id(session[:user_id]).role == User::ROLES[0]
        format.html {redirect_to subjects_url, notice: 'You do not have permission to access that page!'}
      else
        format.html # new.html.erb
        # format.json { render json: @subject }
      end
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
    if !session[:user_id] || User.find_by_id(session[:user_id]).role == User::ROLES[0]
      redirect_to home_url, notice: 'You do not have permission to access that page!'
    end
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_url, notice: 'Subject was successfully created.' }
        # format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        # format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to subjects_url, notice: 'Subject was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.destroy
        format.html { redirect_to subjects_url }
        # format.json { head :no_content }
      else
        format.html {redirect_to subjects_url, notice: "Can\'t delete this subject."}
      end
    end
  end
end
