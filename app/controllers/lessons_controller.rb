class LessonsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :authenticate_lesson_owner!, except: [:new, :create]
  before_action :lookup_lesson, except: [:new, :create]
  #TODO make sure lesson cannot be assigned without exercises

  def new
    @lesson = Lesson.new
    @courses = current_user.courses
    @exercises = Exercise.where(created_by_teacher_id: current_user.id)
  end

  def create
    lesson = current_user.create_lesson!(params[:lesson][:course_id], params[:lesson][:description]) #lesson_params)
    if lesson != nil
      flash[:notice] = "Lesson created successfully!"
      redirect_to lesson_choose_exercise_path(lesson.id)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    @lesson = lookup_lesson
  end

  def edit
    #Description only
    #TODO
  end

  def update
    #TODO
  end

  def choose_exercise
    @lesson_exercise = LessonExercise.new
    @lesson = lookup_lesson
    @exercises = Exercise.where(created_by_teacher_id: current_user.id)
    @assignment = Assignment.new
  end

  def add_exercise #remove exercise
    @lesson = lookup_lesson
    if LessonExercise.create!(lesson_id: params[:lesson_id], exercise_id: params[:exercise_id])
      flash[:notice] = "Exercise added!"
      redirect_to lesson_choose_exercise_path(@lesson)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :choose_exercise
    end
  end

  def remove_exercise
    fail #TODO
  end

  def destroy
    #TODO
  end


  private
    def lesson_params #TODO: FIX create function to take this (user func takes 2 args OR pass in params more securely
      params.require(:lesson).permit(:course_id, :description)
    end

  def authenticate_teacher!
    raise User::UnauthorizedError unless current_user.teacher?
    #TODO change user_role to enum
    #TODO define UnauthorizedError
  end

  def authenticate_lesson_owner!
    #TODO security
    raise User::UnauthorizedError unless Lesson.find(params[:lesson_id].to_i).created_by_teacher_id == current_user.id
  end

  def lookup_lesson
    Lesson.find(params[:lesson_id].to_i)
  end


end
