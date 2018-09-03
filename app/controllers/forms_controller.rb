class FormsController < ApplicationController

  def new
    @student = Student.find(params[:student][:student_id])
    @form = Form.new
  end

  def select_teacher
    @teachers = User.where(role: 1)
  end

  def select_student
    @teacher = User.find(params[:teacher][:teacher_id])
    @students = @teacher.students
  end

  def create
    @student = Student.find(params[:form][:student_id])
    @form = @student.forms.new(form_params)
    require 'pry'; binding.pry
    if @form.save
      flash[:success] = "Thank you for filling out your form, #{@student.first_name}"
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def form_params
      params.require(:form).permit(:mood, :worked_hard_at, :done_better_at, :favorite_part)
    end

end
