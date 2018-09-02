class Teacher::StudentsController < Teacher::BaseController

  def index
  end

  def new
    @teacher = current_user
    @student = @teacher.students.new
  end

  def create
    current_user.students.create(student_params)
  end

  private

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end

end
