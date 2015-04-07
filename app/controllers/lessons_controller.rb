class LessonsController < ApplicationController
  before_action :authenticate_teacher!
  #TODO make sure lesson cannot be assigned without exercises

  def new
    @lesson = Lesson.new
  end

  def create
    lesson = current_user.create_lesson!(params[:course_id], params[:lesson][:description]) #lesson_params)
    if lesson != nil
      redirect_to new_course_lesson_path(params[:course_id].to_i)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  def edit
    #TODO
  end

  def update
    #TODO
  end

  def choose_exercise
    fail
  end

  def add_exercise
    fail
  end

  def destroy
    #TODO
  end

  # def return_words
  #   response = Forvo.get_word_pronunciations('cat', '3')
  #   #check_or_add_to forvo table
  #   head :ok
  # end

  private
    def lesson_params #TODO: FIX create function to take this (user func takes 2 args OR pass in params more securely
      params.require(:lesson).permit(:course_id, :description)
    end

    def authenticate_teacher!  
      raise User::UnauthorizedError unless (current_user.user_courses.where(course_id: params[:course_id]).first.user_role == "teacher")
      #TODO change user_role to enum
      #TODO define UnauthorizedError
    end


end
