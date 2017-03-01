class EducationDetailsController < ApplicationController
  def index
    @education_details=EducationDetail.all
  end
  def new
    @education_detail=EducationDetail.new
  end
  def create
    @education_details=EducationDetail.new(education_details_param)
    if @education_details.save
      redirect_to education_details_url
    else
      render "new"
    end
  end
  def edit
     @education_detail = EducationDetail.find_by(id: params[:id])
  end
  def update
    @education_detail = EducationDetail.find_by(id: params[:id])

    if @education_detail.update(education_details_param)
      redirect_to education_details_path
    else
      render "edit"
    end
  end
  def destroy
    @education_detail=EducationDetail.find_by(id: params[:id])
    if @education_detail.destroy
      redirect_to education_details_url
    end
  end
  private
  def education_details_param
    params.require(:education_detail).permit(:qualification,:course,:specialization,:college,:course_type,:passing_year)
  end
end
