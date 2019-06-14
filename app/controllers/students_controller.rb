class StudentsController < ApplicationController

  before_action :find_student, only: [:edit, :update, :destroy, :show]

  def index
    @students = Student.paginate(page: params[:page], per_page: 5)
  end

  def new
    @student = current_user.students.new
  end

  def create
  	@student = current_user.students.create(students_params)
  	@student.school_id = @student.division.school_id
  	if @student.save
  		redirect_to user_students_path(current_user)
  	end
  end

  def edit
  end

  def update
    if @student.update(students_params)
      redirect_to user_students_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    if @student.destroy
      redirect_to user_students_path(current_user)
    end
  end

  def show
  end

  def searching_student
    @students = Student.joins(:division, :school).where("(students.name LIKE ?) OR (divisions.name LIKE ?) OR (schools.name LIKE ?)", "%#{params[:search]}%", "%#{params[:search]}%" , "%#{params[:search]}%" ).paginate(page: params[:page], per_page: 5)
    if @student.nil?
      binding.pry
      flash.now[:notice] = "Oops No Record Found"
    else
      respond_to do |format|
        format.js {}
      end
    end
  end

  def import
    Student.import(params[:file])
    redirect_to user_students_path(current_user)
  end



  private

  def find_student
    @student = Student.find_by_id(params[:id])
  end

  def students_params
  	params.require(:student).permit(:name, :email, :password, :password_confirmation, :school_id, :division_id, :father_name, :mother_name, :gender, :dob, :contact_no, :user_id, :school_id, :picture)
  end

end
