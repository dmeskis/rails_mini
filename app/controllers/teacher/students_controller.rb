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

  def edit
    @guardians = User.where(role: 0).all
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:success] = "Student successfully updated!"
      redirect_to teacher_student_path(@student)
    else
      flash[:failure] = "Something went wrong, please try again."
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:success] = "Student has been deleted!"
      redirect_to teacher_students_path
    else
      flash[:failure] = "Something went wrong, student could not be deleted."
      redirect_to teacher_student_path(@student)
    end
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
