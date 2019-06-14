class AttendancesController < ApplicationController

  def index
    @division = Division.find_by_id(params[:division_id])
    @attendance = @division.attendances
    @attendances = @division.attendances
  end

  def new
    @school = School.find_by_id(params[:school_id])
    @division = Division.find_by_id(params[:division_id])
    @attendance = @division.attendances.new
  end

  def create
    @school = School.find_by_id(params[:school_id])
    @division = Division.find_by_id(params[:division_id])
    @attendance = @division.attendances.create(attendance_params)
    @students = params[:attendances].keys.map{|e| e.to_i}
    @attendance.students<< Student.find(@students)
    if @attendance.save
      redirect_to user_school_division_attendances_path(current_user, @school, @division)
    end
  end

  def division_school
    @school = School.find_by_id(params[:school_id])
    @divisions = @school.divisions
  end

  def show
    @school = School.find_by_id(params[:school_id])
    @division = Division.find_by_id(params[:division_id])
    @attendance = Attendance.find_by_id(params[:id])
    @attendances = @attendance.students
  end

  def edit
    @school = School.find_by_id(params[:school_id])
    @division = Division.find_by_id(params[:division_id])
    @attendance = Attendance.find_by_id(params[:id])
  end

  def update
  end

  def destroy
    @school = School.find_by_id(params[:school_id])
    @division = Division.find_by_id(params[:division_id])
    @attendance = Attendance.find_by_id(params[:id])
    if @attendance.destroy
      redirect_to user_school_division_attendances_path(current_user, @school, @division)
    end
  end

  def all_attendance
    @school = School.all
  end

  def sorting
  end

  private

  def attendance_params
    params.require(:attendance).permit(:date, :division_id, :user_id, student_id: [])
  end

end
