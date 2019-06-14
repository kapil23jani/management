class WelcomesController < ApplicationController


  def index 
    @schools = School.all
  end

  def school_divisions
    @school = School.find_by_id(params[:school_id])
    @divisions = @school.divisions.order("name ASC")
  end

  def division_attendance
    @division = Division.find_by_id(params[:division_id])
    @attendance = @division.attendances.map{|s| s.students.group_by_month(:created_at).count}
  end

  def search_by_school
    @school = Student.where('name LIKE ? OR email LIKE ? OR contact_no LIKE ?',  "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      respond_to do |format|
        format.js {}
      end
  end

end
