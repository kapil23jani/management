class ProfessorsController < ApplicationController

  before_action :find_professors, only: [:edit, :update, :show, :destroy]

  def index
    @professors = Professor.all
  end


  def new
    @professor = current_user.professors.new
  end

  # POST /resource
  def create
    @professor = current_user.professors.create(professor_params)
    if @professor.save
       ExampleMailer.sample_email("kapil.spaceo@gmail.com").deliver
      redirect_to user_professors_path(current_user)
    end
  end


  def edit 
  end

  def update
    if @professor.update(professor_params)
      redirect_to user_professors_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    if @professor.destroy
      redirect_to user_professors_path(current_user)
    end
  end




  private

  def professor_params
    params.require(:professor).permit(:email, :user_id, :school_id, :password, :password_confirmation, :name, :dob, :subject, :address, :mobile_no, :experience)
  end

  def find_professors
    @professor = Professor.find_by_id(params[:id])
  end
end