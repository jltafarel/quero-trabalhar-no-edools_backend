class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :get_schools, only: [:new, :edit]

  respond_to :html
  has_scope :title_search
  has_scope :by_school

  def index
    @courses = apply_scopes(Course).all
    @schools = School.all
    respond_with(@courses)
  end

  def show
    respond_with(@course)
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.save
    respond_with(@course)
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def get_schools
      @schools = School.all
    end

    def course_params
      params.require(:course).permit(:title, :school_id, :description, :content, :duration, :creation_date, :active_students, :price)
    end
end
