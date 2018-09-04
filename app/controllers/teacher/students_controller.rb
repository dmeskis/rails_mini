class Teacher::StudentsController < Teacher::BaseController

  def index
    @students = current_user.students.order(:last_name)
  end

  def show
    @student = Student.find(params[:id])
    @newest_form = @student.forms.last
    @forms = @student.forms
  end

  def new
    @teacher = current_user
    @student = @teacher.students.new
  end

  def create
    student = current_user.students.create(student_params)
    redirect_to user_students_path(current_user)
  end

  private

    def student_params
      params.require(:student).permit(:first_name, :last_name, :image)
    end

end
