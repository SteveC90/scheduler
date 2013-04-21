class InstructorsController < ApplicationController
  # GET /instructors
  # GET /instructors.json
  def index
    @instructors = Instructor.all

    respond_to do |format|
      if !session[:user_id]
        format.html {redirect_to home_url, notice: 'You must be logged in to access that page!'}
      else
        format.html # index.html.erb
        # format.json { render json: @instructors }
      end
    end
  end

  # GET /instructors/1
  # GET /instructors/1.json
  # def show
  #   @instructor = Instructor.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @instructor }
  #   end
  # end

  # GET /instructors/new
  # GET /instructors/new.json
  def new
    @instructor = Instructor.new

    respond_to do |format|
      if !session[:user_id] || User.find_by_id(session[:user_id]).role == User::ROLES[0]
        format.html {redirect_to home_url, notice: 'You do not have permission to create courses'}
      else
        format.html # new.html.erb
        #format.json { render json: @instructor }
      end
    end
  end

  # GET /instructors/1/edit
  def edit
    @instructor = Instructor.find(params[:id])
  end

  # POST /instructors
  # POST /instructors.json
  def create
    @instructor = Instructor.new(params[:instructor])

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to instructors_url, notice: 'Instructor was successfully created.' }
        # format.json { render json: @instructor, status: :created, location: @instructor }
      else
        format.html { render action: "new" }
        # format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /instructors/1
  # PUT /instructors/1.json
  def update
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      if @instructor.update_attributes(params[:instructor])
        format.html { redirect_to instructors_url, notice: 'Instructor was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.json
  def destroy
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      if @instructor.destroy
        format.html { redirect_to instructors_url }
        # format.json { head :no_content }
      else
        format.html { redirect_to instructors_url, notice: "Can\'t delete this instructor since it has sections."}
      end
    end
  end
end
