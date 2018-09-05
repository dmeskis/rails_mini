class Guardian::StudentsController < Guardian::BaseController

  def index
    @students = current_user.students
  end

  def show
    @student = Student.find(params[:id])
    @newest_form = @student.forms.last
    @forms = @student.forms
  end
end
