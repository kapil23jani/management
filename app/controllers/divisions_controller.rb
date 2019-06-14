class DivisionsController < ApplicationController

  before_action :school_find, only: [:edit, :update, :show, :destroy, :create, :new]
  before_action :find_division, only: [:edit, :update, :show, :destroy]

  def new
    @division = @school.divisions.new
  end 


  def create
    @division = @school.divisions.create(division_params)
    if @division.save 
      redirect_to user_school_path(current_user, @school)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @division.update(division_params)
      redirect_to user_school_path(current_user, @school)
    else
      render 'edit'
    end
  end

  def destroy
    if @division.destroy
      redirect_to user_school_path(current_user, @school)
    end
  end

  def show
    @division = Division.find_by_id(params[:id])
    @students = @division.students
    @professors = @division.school.professors
    @students = @division.students
    @alloted_professors = @division.professors
  end

  def teacher_assign
    @division = Division.find_by_id(params[:division_id])
    @professor = Professor.find_by_id(params[:professor_id])
    @division.professors<<@professor
    @alloted_professors = @division.professors
    respond_to do |format|
      format.js{}
    end
  end

  def remove_teacher
    @division = Division.find_by_id(params[:division_id])
    @professor = Professor.find_by_id(params[:professor_id])
  end

  private

  def school_find
    @school = School.find_by_id(params[:school_id])
  end


  def find_division
    @division = Division.find_by_id(params[:id])
  end

  def division_params
    params.require(:division).permit(:name, :section, :strength, :school_id, :user_id)
  end
end
