class Teacher::StudentsController < Teacher::BaseController

  def index
    @students = current_user.students
  end

  def show
    @student = Student.find(params[:id])
    @newest_form = @student.forms.last
  end

  def new
    @teacher = current_user
    @student = @teacher.students.new
  end

  def create
    current_user.students.create(student_params)
    redirect_to user_students_path(current_user)
  end

  private

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end

end
