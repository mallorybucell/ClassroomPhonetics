class LessonsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :authenticate_lesson_owner!, except: [:new, :create, :index, :show] #TODO- need different validation for show b/c lesson not in session at this point
  before_action :lookup_lesson, except: [Ï:new, :create, :index, :show]
  #TODO make sure lesson cannot be assigned without exercises
  #TODO make sure lesson can't be updated if part of ongoing assignment

  def new
    @lesson = Lesson.new
    @courses = current_user.courses
    @exercises = Exercise.where(created_by_teacher_id: current_user.id)
  end

  def create
    lesson = current_user.create_lesson!(params['lesson']['course_id'], params['lesson']['description']) #lesson_params
    if lesson != 
      session[:lesson_id] = lesson.id
      flash[:notice] = "Lesson started and saved!"
      redirect_to lesson_choose_exercise_path(lesson.id)
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to :back
    end
  end

  def index
    @lessons = current_user.lessons
  end

  def show
    @lesson = lookup_lesson ||= Lesson.find(params[:id].to_i)
    @exercises = @lesson.get_exercises
    @assignment = Assignment.new
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
    session[:lesson_id] = @lesson.id
    @exercises = Exercise.where(created_by_teacher_id: current_user.id)
  end

  def add_exercise #remove exercise
    @lesson = lookup_lesson
    @exercise = Exercise.find(params[:exercise_id])
    if LessonExercise.create!(lesson_id: @lesson.id, exercise_id: @exercise.id)
      flash[:notice] = "Exercise '#{@exercise.description}' added to Lesson '#{@lesson.description}'!"
      redirect_to lesson_choose_exercise_path(@lesson)
    else
      flash[:alert] = "Something went wrong. Please try again."
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

  def authenticate_lesson_owner!
    #TODO security
    raise User::UnauthorizedError unless (lookup_lesson.created_by_teacher_id == current_user.id)
  end

  def lookup_lesson
    Lesson.find(session[:lesson_id].to_i)
  end


end
