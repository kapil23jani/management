class SchoolsController < ApplicationController

  before_action :find_school, only: [:edit, :update, :destroy, :show]

  def index
    @schools = School.paginate(page: params[:page], per_page: 1)
  end

  def new
    @school = current_user.schools.new
  end

  def create
    @school = current_user.schools.create(school_params)
    if @school.save 
      redirect_to user_schools_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @divisions = @school.divisions
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to user_schools_path(current_user) 
    else
      render 'edit'
    end
  end

  def destroy
    if @school.destroy
      redirect_to user_schools_path(current_user)
    end
  end



  private

  def find_school
    @school = School.find_by_id(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :email, :contact_no, :street, :landmark, :city, :state, :country, :zipcode)
  end
end
